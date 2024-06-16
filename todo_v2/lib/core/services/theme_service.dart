import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_v2/core/theme/theme.dart';

class ThemeController extends GetxService {
  var themeMode = AppTheme.lightModeTheme.obs;

  final _box = GetStorage();
  final _key = 'isDarkMode';

  @override
  void onInit() {
    super.onInit();
    _loadThemeModeFromBox();
  }

  void toggleTheme() {
    if (themeMode.value == AppTheme.darkModeTheme) {
      Get.changeTheme(AppTheme.lightModeTheme);
      themeMode.value = AppTheme.lightModeTheme;
      _saveThemeModeToBox(false);
    } else {
      Get.changeTheme(AppTheme.darkModeTheme);
      themeMode.value = AppTheme.darkModeTheme;
      _saveThemeModeToBox(true);
    }
  }

  void _loadThemeModeFromBox() {
    bool? isDarkMode = _box.read(_key);

    if (isDarkMode != null && isDarkMode) {
      themeMode.value = AppTheme.darkModeTheme;
      Get.changeTheme(AppTheme.darkModeTheme);
    } else {
      themeMode.value = AppTheme.lightModeTheme;
      Get.changeTheme(AppTheme.lightModeTheme);
    }
  }

  void _saveThemeModeToBox(bool isDarkMode) {
    _box.write(_key, isDarkMode);
  }
}
