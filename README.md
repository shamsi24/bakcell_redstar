# Redstar Module — Native İnteqrasiya Bələdçisi

Bu Flutter modulu native iOS və Android tətbiqlərinə əlavə-edilə-bilən (`add-to-app`) modul kimi paylanır:

- **iOS** — Swift Package Manager (SPM) vasitəsilə
- **Android** — JitPack üzərindən Maven AAR kimi

Sənəd **native developerlər** üçündür — yəni modulu öz host tətbiqinə qoşacaq iOS/Android tərəfini yazan komandalar üçün. Modulu **build edib publish etmək** qaydası ayrıca [`SPM_BUILD.md`](SPM_BUILD.md) sənədindədir.

---

## Modul haqqında qısa məlumat

| | Dəyər |
| --- | --- |
| Modul adı | `RedstarModule` |
| Bundle / Package | `az.kripton.redstar` |
| Min iOS | 13.0 |
| Min Android SDK | 21 |
| Flutter SDK | `>=3.3.3 <4.0.0` |

Native tərəfdən baxanda modul **bir FlutterEngine + bir FlutterViewController** verir. Host tətbiq həmin view controller / fragment-ı öz navigation stack-ində açır.

---

## iOS — Swift Package Manager (SPM)

### 1. Paketi əlavə et

Xcode-da:

1. **File → Add Package Dependencies…**
2. URL: `https://github.com/shamsi24/bakcell_redstar_ios_spm.git`
3. Dependency Rule: `Branch → main` (və ya konkret tag, məs. `1.0.0`)
4. Add Package → target-ə **`RedstarModule`** library-sini əlavə et

> Paket içində `Flutter.xcframework` və bütün plugin xcframework-ləri (`shared_preferences`, `url_launcher`, `sqflite`, `package_info_plus` və s.) **artıq daxildir** — əlavə CocoaPods qurmaq lazım deyil.

### 2. İstifadə (Swift)

`RedstarModule` singleton-dur — bir dəfə `start` olunur, sonra istənilən yerdən eyni `FlutterEngine` istifadə olunur.

#### A) Sadə istifadə — bir view controller aç

```swift
import UIKit
import RedstarModule

final class HomeViewController: UIViewController {

    @IBAction func openRedstar(_ sender: Any) {
        let flutterVC = RedstarModule.shared.makeViewController()
        flutterVC.modalPresentationStyle = .fullScreen
        present(flutterVC, animated: true)
    }
}
```

#### B) Konkret route ilə aç

```swift
let vc = RedstarModule.shared.makeViewController(initialRoute: "/profile")
navigationController?.pushViewController(vc, animated: true)
```

#### C) Tətbiq açılışında engine-i öncədən başlat (cold start sürəti üçün)

`AppDelegate.swift`-də:

```swift
import UIKit
import RedstarModule

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        RedstarModule.shared.start()   // engine warmup
        return true
    }
}
```

Bundan sonra `makeViewController()` çağırışı dərhal işləyəcək — Flutter artıq run-dadır.

### 3. Public API

```swift
public final class RedstarModule {
    public static let shared: RedstarModule

    /// Engine-i başladır (idempotent — təkrar çağırış no-op).
    @discardableResult
    public func start(initialRoute: String? = nil) -> FlutterEngine

    /// Lazımsa engine-i start edir və hazır FlutterViewController qaytarır.
    public func makeViewController(initialRoute: String? = nil) -> FlutterViewController

    /// Birbaşa engine-ə çıxış (MethodChannel qurmaq üçün).
    public let engine: FlutterEngine
}
```

### 4. Host ↔ Flutter rabitə (MethodChannel)

```swift
let channel = FlutterMethodChannel(
    name: "az.kripton.redstar/host",
    binaryMessenger: RedstarModule.shared.engine.binaryMessenger
)

channel.setMethodCallHandler { call, result in
    switch call.method {
    case "getAuthToken":
        result("abc123")
    default:
        result(FlutterMethodNotImplemented)
    }
}
```

---

## Android — JitPack

### 1. Repository-ni əlavə et

**`settings.gradle.kts`** (yeni Gradle layihələri):

```kotlin
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://jitpack.io") }
        maven { url = uri("https://storage.googleapis.com/download.flutter.io") }
    }
}
```

və ya köhnə **`build.gradle`** (root) variantında:

```gradle
allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url 'https://jitpack.io' }
        maven { url 'https://storage.googleapis.com/download.flutter.io' }
    }
}
```

> `download.flutter.io` repo-su **mütləqdir** — Flutter engine AAR-ı oradan gəlir.

### 2. Dependency əlavə et

**App module-un `build.gradle.kts`**-də:

```kotlin
dependencies {
    implementation("com.github.shamsi24.bakcell_redstar:flutter_release:<TAG>")
}
```

Versiyalar (artifactId):

| ArtifactId | Nə vaxt istifadə olunur |
| --- | --- |
| `flutter_release` | Production / release build |
| `flutter_debug` | Lokal debug build (JIT, hot reload üçün modulu Android Studio-dan açanda) |
| `flutter_profile` | Performans profiling |

Build variant-a görə avtomatik seçim:

```kotlin
dependencies {
    releaseImplementation("com.github.shamsi24.bakcell_redstar:flutter_release:<TAG>")
    debugImplementation("com.github.shamsi24.bakcell_redstar:flutter_debug:<TAG>")
    profileImplementation("com.github.shamsi24.bakcell_redstar:flutter_profile:<TAG>")
}
```

> `<TAG>` — JitPack tag-ı (məs. `1.0.0`) və ya `main-SNAPSHOT`. Tag yaratdıqdan sonra JitPack ilk çağırışda build edir (1-3 dəq.).

### 3. App `build.gradle.kts` tələbləri

```kotlin
android {
    compileSdk = 34

    defaultConfig {
        minSdk = 21          // Flutter tələbi
        // ...
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    // 16 KB page-size cihazlar üçün
    packaging {
        jniLibs {
            useLegacyPackaging = false
        }
    }

    // Flutter native debug symbols müəyyən build-lərdə problem yaradır
    buildTypes {
        release {
            // ProGuard/R8 üçün rules SPM modulunda lazım deyilsə də,
            // host tətbiqinin öz rules-ı işləyəcək
        }
    }
}
```

### 4. ProGuard / R8 (release build)

Flutter engine və plugin sinifləri obfuscation-dan qorunmalıdır:

**`proguard-rules.pro`**:

```
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class az.kripton.redstar.** { *; }
-dontwarn io.flutter.embedding.**
```

### 5. AndroidManifest icazələri

Host tətbiqin `AndroidManifest.xml`-inə modulun istifadə etdiyi icazələri əlavə et:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

### 6. İstifadə (Kotlin)

#### A) FlutterActivity vasitəsilə aç

`AndroidManifest.xml`-də:

```xml
<activity
    android:name="io.flutter.embedding.android.FlutterActivity"
    android:theme="@style/Theme.AppCompat.Light.NoActionBar"
    android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
    android:hardwareAccelerated="true"
    android:windowSoftInputMode="adjustResize" />
```

Sonra istənilən yerdən:

```kotlin
import io.flutter.embedding.android.FlutterActivity

startActivity(
    FlutterActivity
        .withNewEngine()
        .initialRoute("/profile")
        .build(this)
)
```

#### B) Önceden warmed engine ilə (sürətli açılış)

**`Application.kt`**:

```kotlin
import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

class App : Application() {
    override fun onCreate() {
        super.onCreate()

        val engine = FlutterEngine(this).apply {
            dartExecutor.executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
            )
        }
        FlutterEngineCache.getInstance().put("redstar_engine", engine)
    }
}
```

`AndroidManifest.xml`-də:

```xml
<application
    android:name=".App"
    ... >
```

Açılış:

```kotlin
startActivity(
    FlutterActivity
        .withCachedEngine("redstar_engine")
        .build(this)
)
```

#### C) FlutterFragment (öz Activity-də)

```kotlin
import io.flutter.embedding.android.FlutterFragment

class RedstarHostActivity : FragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_host)

        val fragment = FlutterFragment
            .withCachedEngine("redstar_engine")
            .build<FlutterFragment>()

        supportFragmentManager
            .beginTransaction()
            .replace(R.id.flutter_container, fragment)
            .commit()
    }
}
```

### 7. Host ↔ Flutter rabitə (MethodChannel)

```kotlin
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugin.common.MethodChannel

val engine = FlutterEngineCache.getInstance().get("redstar_engine")!!
MethodChannel(engine.dartExecutor.binaryMessenger, "az.kripton.redstar/host")
    .setMethodCallHandler { call, result ->
        when (call.method) {
            "getAuthToken" -> result.success("abc123")
            else -> result.notImplemented()
        }
    }
```

---

## Versiyalama

| Platform | Mənbə | Versiya forması |
| --- | --- | --- |
| iOS | `bakcell_redstar_ios_spm` repo | git tag (məs. `1.0.0`) və ya `main` branch |
| Android | `bakcell_redstar` repo (JitPack) | git tag (məs. `1.0.0`) və ya `main-SNAPSHOT` |

Hər iki tərəfdə **eyni tag** istifadə etmək tövsiyə olunur — beləliklə iOS və Android eyni modul build-i ilə işləyir.

---

## Problemlər və həllər

### iOS

**`No such module 'RedstarModule'`**
→ Xcode-da target-ə library əlavə olunmayıb. **Target → General → Frameworks, Libraries, and Embedded Content** bölməsində `RedstarModule` görünməlidir.

**`dyld: Library not loaded: Flutter.framework`**
→ SPM paketi düzgün resolve olunmayıb. **File → Packages → Reset Package Caches** sonra yenidən build.

**Simulator-da `kernel_blob.bin not found`**
→ SPM repo-da release build var, simulator JIT (debug) tələb edir. Modul komandasından debug build push etməsini xahiş et.

### Android

**`Could not find com.github.shamsi24.bakcell_redstar:flutter_release:X`**
→ Səbəbi adətən `download.flutter.io` repo-sunun əskik olmasıdır — onsuz Flutter engine AAR endirilmir.

**JitPack `Build failed`**
→ JitPack log-una bax: `https://jitpack.io/com/github/shamsi24/bakcell_redstar/<TAG>/build.log`. Adətən `jitpack.yml`-də Flutter version və ya plugin uyğunsuzluğudur.

**`Duplicate class io.flutter.*`**
→ Host tətbiqdə artıq başqa bir Flutter modul var. Bir layihədə iki Flutter engine paralel mövcud ola bilmir.

**16 KB page-size crash (Android 15+)**
→ `useLegacyPackaging = false` və modulun ən son tag-ı istifadə olunmalıdır.

---

## Repository linkləri

| Məqsəd | URL |
| --- | --- |
| Source repo (Flutter module) | https://github.com/shamsi24/bakcell_redstar |
| iOS SPM artefakt repo | https://github.com/shamsi24/bakcell_redstar_ios_spm |
| Android JitPack səhifə | https://jitpack.io/#shamsi24/bakcell_redstar |

---

## Əlaqə

Bug, sual və ya yeni feature requests üçün `bakcell_redstar` repo-sunda issue açın.