import 'package:flutter_settings_clean_bloc/feautures/settings/data/data%20sources/settings_local_datasource.dart';

import '../../domain/entities/app_theme.dart';
import '../../domain/repositories/settings_repository.dart';


class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDatasource datasource;

  SettingsRepositoryImpl(this.datasource);

  @override
  Future<AppTheme> getTheme() {
    return datasource.getTheme();
  }

  @override
  Future<void> setTheme(AppTheme theme) {
    return datasource.setTheme(theme);
  }
}
