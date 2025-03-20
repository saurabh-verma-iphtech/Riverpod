// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:user_profile/provider/user_provider.dart';

// class EditProfileScreen extends ConsumerStatefulWidget {
//   const EditProfileScreen({super.key});

//   @override
//   ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
//   late TextEditingController _nameController;
//   late TextEditingController _bioController;
//   late TextEditingController _jobController;
//   late TextEditingController _profilePicController;

//   @override
//   void initState() {
//     super.initState();
//     final selectedUser = ref.read(userProvider.notifier).selectedUser!;
//     _nameController = TextEditingController(text: selectedUser.name);
//     _bioController = TextEditingController(text: selectedUser.bio);
//     _jobController = TextEditingController(text: selectedUser.jobProfile);
//     _profilePicController = TextEditingController(
//       text: selectedUser.profilePic,
//     );
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _bioController.dispose();
//     _jobController.dispose();
//     _profilePicController.dispose();
//     super.dispose();
//   }

//   void _saveChanges() {
//     final notifier = ref.read(userProvider.notifier);
//     final user = notifier.selectedUser!;
//     final updatedUser = user.copyWith(
//       name: _nameController.text.trim(),
//       bio: _bioController.text.trim(),
//       jobProfile: _jobController.text.trim(),
//       profilePic: _profilePicController.text.trim(),
//     );

//     notifier.updateUser(updatedUser);

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Profile updated successfully!')),
//     );
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile'),
//         backgroundColor: const Color.fromARGB(221, 127, 171, 248),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             const SizedBox(height: 12),
//             TextField(
//               controller: _bioController,
//               decoration: const InputDecoration(labelText: 'Bio'),
//             ),
//             const SizedBox(height: 12),
//             TextField(
//               controller: _jobController,
//               decoration: const InputDecoration(labelText: 'Job Profile'),
//             ),
//             const SizedBox(height: 12),
//             TextField(
//               controller: _profilePicController,
//               decoration: const InputDecoration(
//                 labelText: 'Profile Picture URL',
//               ),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: _saveChanges,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(221, 127, 171, 248),
//               ),
//               child: const Text(
//                 'Save Changes',
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
