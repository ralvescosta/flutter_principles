import 'package:architecture_week/app/interfaces/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalStorageService implements ILocalStorage {
  @override
  Future delete(String key) async {
    final shared = await SharedPreferences.getInstance();
    shared.remove(key);
    return;
  }

  @override
  Future get(String key) async {
    final shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future insert(String key, dynamic value) async {
    final shared = await SharedPreferences.getInstance();
    if (value is bool) {
      shared.setBool(key, value);
    }
  }
}
