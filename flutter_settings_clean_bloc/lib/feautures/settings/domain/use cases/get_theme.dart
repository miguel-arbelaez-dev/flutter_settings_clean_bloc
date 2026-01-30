
import 'package:flutter_settings_clean_bloc/core/use%20cases/usecase.dart';

import '../entities/app_theme.dart';
import '../repositories/settings_repository.dart';

class GetTheme implements UseCase<AppTheme, NoParams> {
  final SettingsRepository repository;

  GetTheme(this.repository);

  @override
  Future<AppTheme> call(NoParams params) {
    return repository.getTheme();
  }
}
