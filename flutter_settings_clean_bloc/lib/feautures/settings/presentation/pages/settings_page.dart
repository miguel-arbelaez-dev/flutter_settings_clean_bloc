import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';
import '../bloc/settings_state.dart';
import '../../domain/entities/app_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is! SettingsLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: AppTheme.values.map((theme) {
              return RadioListTile<AppTheme>(
                title: Text(theme.name),
                value: theme,
                groupValue: state.theme,
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<SettingsBloc>()
                        .add(ChangeThemeEvent(value));
                  }
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
