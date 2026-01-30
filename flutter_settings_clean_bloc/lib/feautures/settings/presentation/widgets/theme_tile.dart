import 'package:flutter/material.dart';
import 'package:flutter_settings_clean_bloc/feautures/settings/presentation/widgets/theme_selector_sheet.dart';

import '../../domain/entities/app_theme.dart';


class ThemeTile extends StatelessWidget {
  final AppTheme currentTheme;

  const ThemeTile({super.key, required this.currentTheme});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.dark_mode_outlined),
      title: const Text('Theme'),
      subtitle: Text(_label(currentTheme)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        showThemeSelectorSheet(
          context: context,
          currentTheme: currentTheme,
        );
      },
    );
  }

  String _label(AppTheme theme) {
    switch (theme) {
      case AppTheme.light:
        return 'Light';
      case AppTheme.dark:
        return 'Dark';
      case AppTheme.system:
        return 'System';
    }
  }
}
