import 'package:get_it/get_it.dart';
import 'package:redstar_module/data/service/api/api.dart';
import 'package:redstar_module/presentation/components/helper/date_picker_helper.dart';
import 'package:redstar_module/presentation/shared/ui_refresh_controller.dart';

// Create a singleton instance of GetIt for dependency injection.
GetIt locator = GetIt.instance;

// Injector class handles the registration of services, components, and repositories in GetIt.
class Injector {
  // Asynchronous method to register all dependencies.
  static register() async {
    await _registerRepositories();
    await _registerComponents();
    await _registerServices();
  }

  // Register services as singletons in the locator.
  static _registerServices() {
    // Registers ApiService as a singleton, meaning a single instance is used throughout the app.
    locator.registerSingleton<ApiService>(ApiService());
    // Registers UIRefreshController as a singleton to manage UI refreshes.
    locator.registerSingleton<UIRefreshController>(UIRefreshController());
  }

  // Register components as factory instances in the locator.
  static _registerComponents() {
    // Registers DatePickerHelper as a factory, creating a new instance each time it's requested.
    locator.registerFactory<DatePickerHelper>(() => DatePickerHelper());
    // Registers ShareManager as a factory, creating a new instance each time it's requested.
  }

  // Placeholder method for registering repositories. Currently, it's empty but can be used to register repository dependencies.
  static _registerRepositories() {}
}
