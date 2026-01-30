import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_settings_clean_bloc/core/use%20cases/usecase.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/domain/entities/app_theme.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/domain/use%20cases/get_theme.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/domain/use%20cases/set_theme.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/presentation/bloc/settings_event.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/presentation/bloc/settings_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';



class MockGetTheme extends Mock implements GetTheme {}
class MockSetTheme extends Mock implements SetTheme {}

void main() {
  late MockGetTheme mockGetTheme;
  late MockSetTheme mockSetTheme;

  setUp(() {
    mockGetTheme = MockGetTheme();
    mockSetTheme = MockSetTheme();
  });

  group('SettingsBloc', () {
    blocTest<SettingsBloc, SettingsState>(
      'emits SettingsLoaded with dark theme when ChangeThemeEvent is added',
      build: () {
        when(() => mockGetTheme(NoParams()))
            .thenAnswer((_) async => AppTheme.system);

        when(() => mockSetTheme(AppTheme.dark))
            .thenAnswer((_) async {});

        return SettingsBloc(
          getTheme: mockGetTheme,
          setTheme: mockSetTheme,
        );
      },
      act: (bloc) {
        bloc.add(ChangeThemeEvent(AppTheme.dark));
      },
      expect: () => [
        isA<SettingsLoaded>().having(
          (state) => state.theme,
          'theme',
          AppTheme.dark,
        ),
      ],
    );
  });
}
