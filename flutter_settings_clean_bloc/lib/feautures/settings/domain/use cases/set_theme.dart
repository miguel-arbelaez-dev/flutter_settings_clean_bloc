import 'package:flutter_settings_clean_bloc/core/use%20cases/usecase.dart';
import '../entities/app_theme.dart';
import '../repositories/settings_repository.dart';

class SetTheme implements UseCase<void, AppTheme> {
  final SettingsRepository repository;

  SetTheme(this.repository);

  @override
  Future<void> call(AppTheme theme) {
    return repository.setTheme(theme);
  }
}
