import '../../../../core/services/local_storage_service.dart';
import '../../../../core/utils/constants.dart';
import '../models/theme_model.dart';
import '../../domain/entities/app_theme.dart';

abstract class SettingsLocalDatasource {
  Future<AppTheme> getTheme();
  Future<void> setTheme(AppTheme theme);
}

class SettingsLocalDatasourceImpl implements SettingsLocalDatasource {
  final LocalStorageService storage;

  SettingsLocalDatasourceImpl(this.storage);

  @override
  Future<AppTheme> getTheme() async {
    final value = await storage.getString(themeKey);
    if (value == null) return AppTheme.system;
    return ThemeModel.fromStorage(value);
  }

  @override
  Future<void> setTheme(AppTheme theme) async {
    await storage.setString(themeKey, ThemeModel.toStorage(theme));
  }
}
