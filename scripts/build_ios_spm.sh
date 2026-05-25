#!/usr/bin/env bash
# Build iOS xcframeworks for SPM distribution.
# Usage: build_ios_spm.sh [debug|release] [--push]
#   debug   → JIT artifacts (kernel_blob.bin) — works on iOS Simulator + device debug
#   release → AOT artifacts — production / App Store builds (simulator will NOT run)
#   --push  → after build, force-push artifacts to the standalone SPM repo
# Output: ios_spm/Frameworks/<framework>.xcframework
set -euo pipefail

SPM_REMOTE="https://github.com/shamsi24/bakcell_redstar_ios_spm.git"
PUBLISH_DIR=".spm_publish"

MODE="release"
DO_PUSH=0
for arg in "$@"; do
  case "$arg" in
    debug)   MODE="debug" ;;
    release) MODE="release" ;;
    --push)  DO_PUSH=1 ;;
    *) echo "Usage: $0 [debug|release] [--push]"; exit 1 ;;
  esac
done

case "$MODE" in
  debug)   FLUTTER_MODE_FLAGS=(--debug   --no-profile --no-release); MODE_DIR="Debug" ;;
  release) FLUTTER_MODE_FLAGS=(--no-debug --no-profile --release);   MODE_DIR="Release" ;;
esac

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

OUT="ios_spm/Frameworks"
WORK="ios_spm/.work"

publish_to_spm_repo() {
  [ "$DO_PUSH" = "1" ] || return 0

  echo "==> Publishing to $SPM_REMOTE"
  rm -rf "$PUBLISH_DIR"
  mkdir -p "$PUBLISH_DIR/ios_spm"

  cp Package.swift "$PUBLISH_DIR/"
  cp -R Sources "$PUBLISH_DIR/"
  cp -R "$OUT" "$PUBLISH_DIR/ios_spm/"

  cat > "$PUBLISH_DIR/README.md" <<EOF
# Bakcell Redstar iOS SPM

Auto-generated Swift Package — do not edit manually.
Source: \`redstar_module\` Flutter module.

- Build mode: **$MODE**
- Built at: $(date '+%Y-%m-%d %H:%M:%S %Z')

## Usage

In Xcode: **File → Add Package Dependencies** → enter this repo URL.
EOF

  cat > "$PUBLISH_DIR/.gitignore" <<'EOF'
.DS_Store
.swiftpm/
.build/
EOF

  (
    cd "$PUBLISH_DIR"
    git init -q -b main
    git add .
    git commit -q -m "build: $MODE ($(date '+%Y-%m-%d %H:%M'))"
    git remote add origin "$SPM_REMOTE"
    echo "    pushing ~$(du -sh . | awk '{print $1}') (force, overwrites main)..."
    git push --force origin main
  )

  echo "==> Pushed to $SPM_REMOTE (branch: main)"
}

echo "==> Mode: $MODE"
echo "==> flutter pub get"
flutter pub get

echo "==> flutter build ios-framework ($MODE)"
rm -rf "$OUT" "$WORK"
flutter build ios-framework \
  --no-universal \
  --xcframework \
  "${FLUTTER_MODE_FLAGS[@]}" \
  --output="$OUT"

echo "==> Flatten $MODE_DIR/ → Frameworks/"
if [ -d "$OUT/$MODE_DIR" ]; then
  mv "$OUT/$MODE_DIR"/* "$OUT/"
  rmdir "$OUT/$MODE_DIR"
fi
rm -rf "$OUT/Debug" "$OUT/Profile" "$OUT/Release"

echo "==> Convert objective_c.framework → objective_c.xcframework (if needed)"
if [ -d "$OUT/objective_c.xcframework" ] && [ ! -d "$OUT/objective_c.framework" ]; then
  echo "    Flutter already produced objective_c.xcframework — skipping conversion."
elif [ ! -d "build/native_assets/ios/objective_c.framework" ] && [ ! -d "$OUT/objective_c.framework" ]; then
  echo "    No objective_c native asset present — skipping."
else
  SIM_FW="build/native_assets/ios/objective_c.framework"
  [ -d "$SIM_FW" ] || SIM_FW="$OUT/objective_c.framework"

  # Locate the most recent device-built dylib (platform=2, arm64) cached by native_assets hook.
  DEVICE_DYLIB=""
  for cand in $(ls -t .dart_tool/hooks_runner/shared/objective_c/build/*/objective_c.dylib 2>/dev/null); do
    if [ "$(file "$cand" | grep -oE 'arm64|x86_64')" = "arm64" ] \
       && otool -l "$cand" | grep -A3 LC_BUILD_VERSION | grep -qE 'platform 2$'; then
      DEVICE_DYLIB="$cand"
      break
    fi
  done
  if [ -z "$DEVICE_DYLIB" ]; then
    echo "ERROR: no device (arm64, platform=2) objective_c.dylib in hooks_runner cache." >&2
    exit 1
  fi
  echo "    device dylib: $DEVICE_DYLIB"

  mkdir -p "$WORK/device/objective_c.framework"
  cp "$DEVICE_DYLIB" "$WORK/device/objective_c.framework/objective_c"
  cp "$SIM_FW/Info.plist" "$WORK/device/objective_c.framework/"
  install_name_tool -id @rpath/objective_c.framework/objective_c \
    "$WORK/device/objective_c.framework/objective_c"
  codesign --remove-signature "$WORK/device/objective_c.framework" 2>/dev/null || true

  mkdir -p "$WORK/sim"
  cp -R "$SIM_FW" "$WORK/sim/"
  rm -rf "$WORK/sim/objective_c.framework/_CodeSignature"

  rm -rf "$OUT/objective_c.framework" "$OUT/objective_c.xcframework"
  xcodebuild -create-xcframework \
    -framework "$WORK/device/objective_c.framework" \
    -framework "$WORK/sim/objective_c.framework" \
    -output "$OUT/objective_c.xcframework" >/dev/null

  rm -rf "$WORK"
fi

echo "==> Done. Frameworks in $OUT:"
ls "$OUT"

publish_to_spm_repo
