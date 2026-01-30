import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_clean_bloc/core/use%20cases/usecase.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/domain/use%20cases/get_theme.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/domain/use%20cases/set_theme.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetTheme getTheme;
  final SetTheme setTheme;

  SettingsBloc({
    required this.getTheme,
    required this.setTheme,
  }) : super(SettingsInitial()) {
    on<LoadThemeEvent>(_onLoadTheme);
    on<ChangeThemeEvent>(_onChangeTheme);
  }

  Future<void> _onLoadTheme(
    LoadThemeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final theme = await getTheme(NoParams());
    emit(SettingsLoaded(theme));
  }

  Future<void> _onChangeTheme(
    ChangeThemeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await setTheme(event.theme);
    emit(SettingsLoaded(event.theme));
  }
}
