import Flutter
import FlutterPluginRegistrant
import UIKit

public final class RedstarModule {

    public static let shared = RedstarModule()

    public let engine: FlutterEngine
    private var started = false

    private init() {
        engine = FlutterEngine(name: "redstar_module_engine", project: nil)
    }

    @discardableResult
    public func start(initialRoute: String? = nil) -> FlutterEngine {
        if started { return engine }

        if let route = initialRoute {
            engine.navigationChannel.invokeMethod("setInitialRoute", arguments: route)
        }

        engine.run()
        GeneratedPluginRegistrant.register(with: engine)
        started = true

        return engine
    }

    public func makeViewController(initialRoute: String? = nil) -> FlutterViewController {
        start(initialRoute: initialRoute)
        return FlutterViewController(engine: engine, nibName: nil, bundle: nil)
    }
}
