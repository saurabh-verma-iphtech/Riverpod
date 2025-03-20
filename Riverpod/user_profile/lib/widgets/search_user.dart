import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile/provider/theme_provider.dart';
import 'package:user_profile/provider/user_provider.dart';
import 'package:user_profile/screen/profile_screen.dart';

class SearchUserList extends ConsumerStatefulWidget {
  const SearchUserList({super.key});

  @override
  ConsumerState<SearchUserList> createState() => _SearchUserListState();
}

class _SearchUserListState extends ConsumerState<SearchUserList> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userNotifier = ref.read(userProvider.notifier);
    final users = ref.watch(userProvider);
    final isDark = ref.watch(themeProvider).isDark;

    final filteredUsers =
        users.where((user) {
          return user.name.toLowerCase().contains(
            _searchController.text.toLowerCase(),
          );
        }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Search by name...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon:
                  _searchController.text.isNotEmpty
                      ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {});
                        },
                      )
                      : null,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        Expanded(
          child:
              filteredUsers.isEmpty
                  ? const Center(child: Text('No users found'))
                  : ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = filteredUsers[index];
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        height: 80,
                        margin: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 6,
                        ),

                        // decoration: BoxDecoration(
                        //   color:
                        //       index.isEven
                        //           ? Colors.blue.shade100
                        //           : Colors.green.shade100,
                        //   borderRadius: BorderRadius.circular(12),
                        // ),
                        decoration: BoxDecoration(
                          color:
                              index.isEven
                                  ? (isDark
                                      ? Colors.grey.shade800
                                      : Colors.blue.shade100)
                                  : (isDark
                                      ? Colors.grey.shade700
                                      : Colors.green.shade100),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(user.profilePic),
                            ),
                            title: Text(
                              user.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Color.fromARGB(212, 205, 100, 93),
                              ),
                              onPressed: () => userNotifier.deleteUser(user.id),
                            ),
                            onTap: () {
                              userNotifier.selectUser(user);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ProfilePage(),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
        ),
      ],
    );
  }
}
