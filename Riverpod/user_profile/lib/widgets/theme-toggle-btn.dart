import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile/provider/theme_provider.dart';


// Reusable ThemeToggleButton Widget
class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);

    return IconButton(
      icon: Icon(
        themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
        color: Colors.black,
      ),
      onPressed: () {
        themeNotifier.toggleTheme();
      },
    );
  }
}
