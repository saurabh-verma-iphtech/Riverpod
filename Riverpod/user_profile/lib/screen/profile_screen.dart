import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile/widgets/fade-in-animation.dart';
import 'package:user_profile/provider/user_provider.dart';
import 'package:user_profile/screen/user_bio.dart';
import 'package:user_profile/widgets/theme-toggle-btn.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUser = ref.read(userProvider.notifier).selectedUser;

    if (selectedUser == null) {
      return Scaffold(body: Center(child: Text('No user selected')));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedUser.name,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(221, 127, 171, 248),
        actions: [ThemeToggleButton()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Center(
            child: StaggeredProfileAnimation(
              // I Used the staggered animation widget
              image: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(
                        221,
                        127,
                        171,
                        248,
                      ).withOpacity(0.2),
                      spreadRadius: 0.1,
                      blurRadius: 50,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Hero(
                  tag: selectedUser.id,
                  child: Image.network(selectedUser.profilePic),
                ),
              ),
              name: Text(
                selectedUser.name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              bio: Column(
                children: [
                  Text(selectedUser.bio, style: const TextStyle(fontSize: 15)),
                  Text(selectedUser.jobProfile),
                ],
              ),
              button: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => UserBio()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(221, 127, 171, 248),
                  ),
                ),
                child: const Text(
                  'Detailed Bio',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
