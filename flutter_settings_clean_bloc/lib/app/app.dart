import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/domain/entities/app_theme.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/presentation/bloc/settings_state.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/presentation/pages/settings_page.dart';
import 'app_providers.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          ThemeMode themeMode = ThemeMode.system;

          if (state is SettingsLoaded) {
            switch (state.theme) {
              case AppTheme.light:
                themeMode = ThemeMode.light;
                break;
              case AppTheme.dark:
                themeMode = ThemeMode.dark;
                break;
              case AppTheme.system:
                themeMode = ThemeMode.system;
                break;
            }
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Settings',
            themeMode: themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: const SettingsPage(),
          );
        },
      ),
    );
  }
}
