import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

class DependencyInjection {
  static Future<void> inject() async {
    injector.allowReassignment = true;

    final sharedPreferences = await SharedPreferences.getInstance();
    injector.registerSingleton<SharedPreferences>(sharedPreferences);

    final localStorage = LocalStorage('local_storage');
    await localStorage.ready;
    injector.registerSingleton<LocalStorage>(localStorage);
  }
}