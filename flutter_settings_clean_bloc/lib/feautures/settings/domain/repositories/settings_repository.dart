import '../entities/app_theme.dart';

abstract class SettingsRepository {
  Future<AppTheme> getTheme();
  Future<void> setTheme(AppTheme theme);
}
