import 'package:architecture_week/app/interfaces/local_storage_interface.dart';
import 'package:architecture_week/app/models/app_config_model.dart';

class ChangeThemeViewModel {
  final ILocalStorage storage;
  final AppConfigModel config = AppConfigModel();

  ChangeThemeViewModel({this.storage});

  Future init() async {
    await storage.get('isDark').then((value) {
      if (value != null) config.themeSwitch.value = value;
    });
  }

  changeTheme(bool value) async {
    config.themeSwitch.value = value;
    await storage.insert("isDark", value);
  }
}
