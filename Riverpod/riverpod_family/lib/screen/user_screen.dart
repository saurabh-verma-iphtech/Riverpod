import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<String> fetchUserName(int userId) async {
  await Future.delayed(Duration(seconds: 2));
  return 'User #$userId';
}

final userProvider = FutureProvider.family<String, int>((ref, userId) {
  return fetchUserName(userId);
});

class UserScreen extends ConsumerWidget {
  final int userId;
  const UserScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider(userId));
    return Scaffold(
      appBar: AppBar(title: Text("User Info")),
      body: Center(
        child: userAsync.when(
          data: (user) => Text('User : $user'),
          error: (err, stack) => Text("Error : $err"),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
