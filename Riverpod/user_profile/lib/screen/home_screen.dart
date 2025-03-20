import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile/widgets/fab.dart';
import 'package:user_profile/provider/user_provider.dart';
import 'package:user_profile/widgets/search_user.dart';
import 'package:user_profile/widgets/theme-toggle-btn.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.read(userProvider.notifier);
    final users = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ProfileMate',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(221, 127, 171, 248),

        // I am adding Theme Mode for Home Screen
        actions: [ThemeToggleButton()],
      ),

      // backgroundColor: Color.fromARGB(255, 221, 223, 223),
      body: const SearchUserList(),

      floatingActionButton: const AnimatedFAB(), // With Animation
      // Without Animation
      // floatingActionButton: FloatingActionButton(
      //   onPressed:
      //       () => Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (_) => AddUser()),
      //       ),
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
