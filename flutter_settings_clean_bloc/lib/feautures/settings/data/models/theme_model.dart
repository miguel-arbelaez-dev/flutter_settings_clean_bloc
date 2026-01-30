import '../../domain/entities/app_theme.dart';

class ThemeModel {
  static String toStorage(AppTheme theme) {
    return theme.name;
  }

  static AppTheme fromStorage(String value) {
    return AppTheme.values.firstWhere(
      (e) => e.name == value,
      orElse: () => AppTheme.system,
    );
  }
}
