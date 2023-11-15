import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../localization/app_localizations_context.dart';
import '../themes/app_icons.dart';
import '../themes/app_theme_mode.dart';

class ThemeModeSwitchIcon extends ConsumerWidget {
// #region
  /// Provides a constructor.
  const ThemeModeSwitchIcon({super.key});
// #endregion

// #region
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Check the current brightness
    final brightness = Theme.of(context).brightness;
    return IconButton(
      onPressed: () {
        return _showNewItemSheet(context);
      },
      icon: brightness == Brightness.dark
          ? const Icon(darkModeIcon)
          : const Icon(lightModeIcon),
    );
  }
// #endregion

// #region
  void _showNewItemSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      elevation: 5,
      context: context,
      builder: (context) {
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ThemeModeSwitcher(),
              Gap(16.0),
            ],
          ),
        );
      },
    );
  }
// #endregion
}

class ThemeModeSwitcher extends ConsumerWidget {
// #region
  /// Provides a constructor.
  const ThemeModeSwitcher({super.key});
// #endregion

// #region
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeMode themeMode = ref.watch(themeModeNotifierProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: Text(context.locale.dark_mode),
        ),
        const Divider(height: 0.0),
        ListTile(
          title: Text(context.locale.dark_mode_disabled),
          leading: Radio<ThemeMode>(
            value: ThemeMode.light,
            groupValue: themeMode,
            onChanged: (value) {
              ref.read(themeModeNotifierProvider.notifier).set(ThemeMode.light);
            },
          ),
        ),
        ListTile(
          title: Text(context.locale.dark_mode_enabled),
          leading: Radio<ThemeMode>(
            value: ThemeMode.dark,
            groupValue: themeMode,
            onChanged: (value) {
              ref.read(themeModeNotifierProvider.notifier).set(ThemeMode.dark);
            },
          ),
        ),
        ListTile(
          title: Text(context.locale.dark_mode_follows_system),
          leading: Radio<ThemeMode>(
            value: ThemeMode.system,
            groupValue: themeMode,
            onChanged: (value) {
              ref
                  .read(themeModeNotifierProvider.notifier)
                  .set(ThemeMode.system);
            },
          ),
        ),
      ],
    );
  }
// #endregion
}
