import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/app_theme.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';

void showThemeSelectorSheet({
  required BuildContext context,
  required AppTheme currentTheme,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            _DragHandle(),
            const SizedBox(height: 16),

            _ThemeOptionTile(
              icon: Icons.light_mode_outlined,
              label: 'Light',
              value: AppTheme.light,
              groupValue: currentTheme,
            ),
            _ThemeOptionTile(
              icon: Icons.dark_mode_outlined,
              label: 'Dark',
              value: AppTheme.dark,
              groupValue: currentTheme,
            ),
            _ThemeOptionTile(
              icon: Icons.settings_suggest_outlined,
              label: 'System',
              value: AppTheme.system,
              groupValue: currentTheme,
            ),

            const SizedBox(height: 8),
          ],
        ),
      );
    },
  );
}

class _ThemeOptionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final AppTheme value;
  final AppTheme groupValue;

  const _ThemeOptionTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing:
          isSelected ? const Icon(Icons.check, color: Colors.blue) : null,
      onTap: () {
        context.read<SettingsBloc>().add(ChangeThemeEvent(value));
        Navigator.pop(context);
      },
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
