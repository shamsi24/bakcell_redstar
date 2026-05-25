# SPM Build Guide

Bu Flutter modulu iOS tərəfdə **Swift Package Manager (SPM)** vasitəsilə host iOS tətbiqlərinə inteqrasiya olunur. Sənəd build prosesini, paket əlavə/silmə qaydalarını və problem həllini izah edir.

---

## 1. Necə işləyir?

- `flutter build ios-framework --xcframework` Dart kodunu və hər iOS pluginini `.xcframework` formatında çıxarır.
- Bu xcframework-lər `ios_spm/Frameworks/` qovluğuna yığılır.
- Root-dakı [`Package.swift`](Package.swift) həmin xcframework-ləri `binaryTarget` kimi göstərir və `RedstarModule` adlı SPM kitabxanası kimi paylayır.
- Host iOS tətbiqi `RedstarModule` paketini import edir.

---

## 2. Tələblər

| Alət | Versiya |
| --- | --- |
| Flutter SDK | `>=3.3.3 <4.0.0` (bax `pubspec.yaml`) |
| Xcode | 15+ |
| macOS | xcframework yaratmaq üçün lazımdır |
| CocoaPods | Flutter `pub get` istifadə edir |

---

## 3. Build (tək komanda)

```bash
# Production üçün (App Store, real cihaz release)
bash scripts/build_ios_spm.sh release

# Simulator-da test etmək üçün (Xcode Debug konfiqurasiyası, JIT lazımdır)
bash scripts/build_ios_spm.sh debug
```

Default: `release`. Arqumentsiz çağırış release build verir.

### Niyə iki mode?

| Mode | Necə işləyir | Harada işləyir |
| --- | --- | --- |
| `release` | AOT (önceden kompilyasiya) | Real iOS cihazı (App Store, TestFlight) |
| `debug` | JIT (`kernel_blob.bin`) | iOS Simulator + real cihaz debug runs |

**iOS Simulator AOT-u dəstəkləmir**, ona görə release build simulator-da bu xəta verir:

```
Failed to find snapshot at .../App.framework/flutter_assets/kernel_blob.bin
[ERROR:flutter/shell/common/engine.cc] Engine run configuration was invalid.
```

Həll: `debug` mode-da yenidən build et.

### Script nə edir

1. `flutter pub get`
2. `flutter build ios-framework --xcframework --output=ios_spm/Frameworks` (verilmiş mode flag-ləri ilə)
3. `Debug/` və ya `Release/` alt-qovluğunu `Frameworks/` səviyyəsinə düzəldir
4. `objective_c.framework`-i (Flutter yalnız simulator slice çıxarır) device + simulator slice ilə tam `objective_c.xcframework`-ə çevirir
5. Yekunda `ios_spm/Frameworks/` qovluğunda təmiz xcframework dəsti qalır

### Yoxlama

```bash
swift package resolve
```

`exit code 0` = hər şey qaydasındadır.

---

## 4. Host iOS tətbiqinə inteqrasiya

İki variant var:

### Variant A — ayrıca SPM repo-dan (tövsiyə olunan)

Build artefaktları ayrıca SPM repo-suna publish olunur:
**https://github.com/shamsi24/bakcell_redstar_ios_spm**

Host iOS layihəsində:

1. **File → Add Package Dependencies**
2. URL-i daxil edin: `https://github.com/shamsi24/bakcell_redstar_ios_spm.git`
3. Branch: `main` seçin
4. `RedstarModule` library-ni target-ə əlavə edin

### Variant B — yerli repo-dan (development üçün)

Bu repo-da build etmisinizsə:

1. **File → Add Package Dependencies → Add Local…**
2. `redstar_module` qovluğunu seçin
3. `RedstarModule` library-ni target-ə əlavə edin

### Swift tərəfdə

```swift
import Flutter
import FlutterPluginRegistrant
import RedstarModule
```

`FlutterEngine` start etdikdən sonra `GeneratedPluginRegistrant.register(with:)` çağırın.

---

## 5. SPM repo-suna publish

```bash
# Production üçün
bash scripts/build_ios_spm.sh release --push

# Simulator-da test üçün debug versiya
bash scripts/build_ios_spm.sh debug --push
```

`--push` flag-i build bitdikdən sonra avtomatik olaraq:

1. `Package.swift`, `Sources/RedstarModule/`, `ios_spm/Frameworks/` faylları `.spm_publish/` qovluğuna kopyalayır
2. Yeni README.md yaradır (build mode + tarix)
3. Yeni bir git commit (`build: <mode> (<date>)`) yaradır
4. `https://github.com/shamsi24/bakcell_redstar_ios_spm.git` repo-sunun **`main` branch**-ına `--force` push edir (tək commit hər zaman)

> **Qeyd:** SPM repo həmişə tək commit-li olur — köhnə versiyalar saxlanılmır. Versiyalandırma lazımdırsa, push-dan sonra GitHub-da tag yaradın (`git tag v1.0.0 && git push --tags`).

> **Qeyd:** Total push ölçüsü ~150-400MB. Bəzi fayllar 50MB-dan böyük olduğundan GitHub xəbərdarlıq verə bilər, amma 100MB hard limit altında olduğu üçün push uğurlu olur.

---

## 6. Yeni Flutter paketi əlavə etdikdə

Əgər əlavə etdiyiniz paketin **iOS native kodu** varsa:

1. `pubspec.yaml`-a paketi əlavə edin
2. `bash scripts/build_ios_spm.sh` icra edin
3. `ios_spm/Frameworks/` qovluğuna **yeni `<plugin_adı>.xcframework`** düşəcək
4. `Package.swift`-də həmin frameworki həm `dependencies:` siyahısına, həm də sonda `.binaryTarget(...)` kimi əlavə edin

Yoxlamaq üçün:

```bash
ls ios_spm/Frameworks/                # nə var
swift package describe | grep "Name:" # Package.swift nəyi görür
```

İki siyahı eyni olmalıdır.

### Paket sildikdə

1. `pubspec.yaml`-dan paketi silin
2. Dart kodunda istifadəni silin (yoxsa build error)
3. `bash scripts/build_ios_spm.sh` icra edin
4. `Package.swift`-dən artıq mövcud olmayan `binaryTarget`-i və `dependencies` qeydini silin

---

## 7. Problemlər və həllər

### `local binary target 'X' does not contain a binary artifact`

Səbəbi: `Package.swift` referenced xcframework yoxdur və ya `.framework` formatındadır (`.xcframework` deyil).

Həll:

```bash
# yenidən build
bash scripts/build_ios_spm.sh
# nəyin olub-olmadığını görmək
ls ios_spm/Frameworks/
```

Əgər plugin pubspec-də yoxdursa, `Package.swift`-dən də silin.

### `Error: Couldn't resolve the package 'X'`

Dart kodu pubspec-də olmayan paketi import edir. Ya pubspec-ə əlavə edin, ya da Dart import-unu silin.

### `Failed to find snapshot ... kernel_blob.bin` (simulator-da)

Release build ilə simulator-da işə salınıb. Simulator JIT (debug mode) tələb edir:

```bash
bash scripts/build_ios_spm.sh debug
```

### `ERROR: no device (arm64, platform=2) objective_c.dylib in hooks_runner cache`

`objective_c` native asset cache-də device slice yoxdur. Bunun üçün ən azı bir dəfə real cihaz üçün build lazımdır:

```bash
flutter build ios --no-codesign
bash scripts/build_ios_spm.sh
```

### Build çox uzun çəkir

Build təxminən 60-90 saniyə çəkir (App + bütün pluginlər). Yalnız Dart kodu dəyişibsə daha sürətlidir, çünki plugin xcframework-ləri Flutter cache-dən gəlir.

### Tam təmiz başlamaq

```bash
flutter clean
rm -rf ios_spm .build build .dart_tool .ios/.symlinks .ios/Pods .ios/Podfile.lock .swiftpm
bash scripts/build_ios_spm.sh
```

---

## 8. Struktur

```
redstar_module/
├── lib/                         # Dart kodu
├── pubspec.yaml                 # Flutter asılılıqları
├── Package.swift                # SPM manifesti — xcframework siyahısı burada
├── Sources/RedstarModule/       # Swift entry point (host tətbiqin görəcəyi)
├── scripts/build_ios_spm.sh     # build automation
└── ios_spm/Frameworks/          # build outputu (git-də deyil)
    ├── App.xcframework
    ├── Flutter.xcframework
    ├── FlutterPluginRegistrant.xcframework
    ├── objective_c.xcframework
    └── <plugin>.xcframework ...
```

`Package.swift`-də `binaryTarget` siyahısı **həmişə** `ios_spm/Frameworks/` ilə eyni olmalıdır.
