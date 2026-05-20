// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "RedstarModule",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "RedstarModule",
            targets: ["RedstarModule"]
        )
    ],
    targets: [
        .target(
            name: "RedstarModule",
            dependencies: [
                "App",
                "Flutter",
                "FlutterPluginRegistrant",
                "objective_c",
                "package_info_plus",
                "shared_preferences_foundation",
                "sqflite_darwin",
                "url_launcher_ios"
            ],
            path: "Sources/RedstarModule",
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("Foundation")
            ]
        ),
        .binaryTarget(name: "App",                            path: "ios_spm/Frameworks/App.xcframework"),
        .binaryTarget(name: "Flutter",                        path: "ios_spm/Frameworks/Flutter.xcframework"),
        .binaryTarget(name: "FlutterPluginRegistrant",        path: "ios_spm/Frameworks/FlutterPluginRegistrant.xcframework"),
        .binaryTarget(name: "objective_c",                    path: "ios_spm/Frameworks/objective_c.xcframework"),
        .binaryTarget(name: "package_info_plus",              path: "ios_spm/Frameworks/package_info_plus.xcframework"),
        .binaryTarget(name: "shared_preferences_foundation",  path: "ios_spm/Frameworks/shared_preferences_foundation.xcframework"),
        .binaryTarget(name: "sqflite_darwin",                 path: "ios_spm/Frameworks/sqflite_darwin.xcframework"),
        .binaryTarget(name: "url_launcher_ios",               path: "ios_spm/Frameworks/url_launcher_ios.xcframework")
    ]
)
