import '../../domain/entities/app_theme.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final AppTheme theme;

  SettingsLoaded(this.theme);
}
