import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile/model/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, List<User>>(
  (ref) => UserNotifier(),
);

class UserNotifier extends StateNotifier<List<User>> {
  UserNotifier()
    : super([
        // User(
        //   id: "1",
        //   name: 'Saurabh',
        //   age: '24',
        //   email: 'saurabh@gmail.com',
        //   bio: 'Software Engineer at IPH',
        //   phoneNo: '234897328957',
        //   profilePic:
        //       'https://t4.ftcdn.net/jpg/03/25/73/59/360_F_325735908_TkxHU7okor9CTWHBhkGfdRumONWfIDEb.jpg',
        //   jobProfile: 'Flutter Developer',
        //   address: "Lucknow"
        // ),
        // User(
        //   id: "2",
        //   name: 'Jack',
        //   age: '34',
        //   email: 'jack@gmail.com',
        //   phoneNo: '234897328957',
        //   bio: 'Software Engineer at IPH',
        //   jobProfile: 'iOS Developer',
        //   address: "Lucknow",
        //   profilePic:
        //       'https://img.freepik.com/premium-photo/confident-businessman-portrait_220507-11527.jpg?semt=ais_hybrid',
        // ),
      ]);

  User? selectedUser;
  void selectUser(User user) {
    selectedUser = user;
  }

  void addUser(User newUser) {
    state = [...state, newUser];
  }

  void deleteUser(String userId) {
    state = state.where((user) => user.id != userId).toList();
  }
  
}
