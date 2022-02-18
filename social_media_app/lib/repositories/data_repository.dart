import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/ModelProvider.dart';

class DataRepository {
  Future<User?> getUserById(String userId) async {
    try {
      final users = await Amplify.DataStore.query(User.classType, where: User.ID.eq(userId));
      return users.isNotEmpty ? users.first : null;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> createUser({required String userId, required String username, String? email}) async {
    final newUser = User(username: username, id: userId, email: email);
    try {
      await Amplify.DataStore.save(newUser);
      return newUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> updateUser(User updatedUser) async {
    try {
      await Amplify.DataStore.save(updatedUser);
      print('Updated user: ${updatedUser.toString()}');
      return updatedUser;
    } catch (e) {
      rethrow;
    }
  }
}
