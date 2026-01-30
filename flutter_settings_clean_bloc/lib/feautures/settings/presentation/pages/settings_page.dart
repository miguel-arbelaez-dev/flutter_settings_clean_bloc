import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/presentation/widgets/settings_section.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/presentation/widgets/theme_tile.dart';

import '../bloc/settings_bloc.dart';
import '../bloc/settings_state.dart';

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

          return ListView(
            children: [
              const SizedBox(height: 16),
              const SettingsSection(title: 'Appearance'),
              ThemeTile(currentTheme: state.theme),
              const Divider(height: 1),
            ],
          );
        },
      ),
    );
  }
}