import 'package:flutter_settings_clean_bloc/feautures/settings/domain/entities/app_theme.dart';

abstract class SettingsEvent {}

class LoadThemeEvent extends SettingsEvent {}

class ChangeThemeEvent extends SettingsEvent {
  final AppTheme theme;

  ChangeThemeEvent(this.theme);
}
