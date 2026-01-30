import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_clean_bloc/core/services/local_storage_service.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/data/data%20sources/settings_local_datasource.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/data/repositories/settings_repository_impl.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/domain/use%20cases/get_theme.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/domain/use%20cases/set_theme.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/presentation/bloc/settings_event.dart';



class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final localStorage = LocalStorageService();
    final datasource = SettingsLocalDatasourceImpl(localStorage);
    final repository = SettingsRepositoryImpl(datasource);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SettingsBloc(
            getTheme: GetTheme(repository),
            setTheme: SetTheme(repository),
          )..add(LoadThemeEvent()),
        ),
      ],
      child: child,
    );
  }
}
