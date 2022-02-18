import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AuthRepository {
  Future<String> _getUserIdFromAttributes() async {
    try {
      print('vi kom hertil 2');
      final attributes = await Amplify.Auth.fetchUserAttributes();
      print('vi kom hertil 3');
      attributes.forEach((element) {
        print('key: ${element.userAttributeKey}; value: ${element.value}');
      });
      final userId = attributes.firstWhere((element) => element.userAttributeKey.toString() == 'sub').value;
      print('vi kom hertil 4');
      print(userId);
      return userId;
      return 'viskum';
    } catch (e) {
      print('vi kom hertil 5 - fejl');
      print(e.toString());
      rethrow;
    }
  }

  Future<String?> attemptAutoLogin() async {
    print('attempting autologin');
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      return session.isSignedIn ? (await _getUserIdFromAttributes()) : null;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> login({required String username, required String password}) async {
    print('attempting login');
    try {
      final result = await Amplify.Auth.signIn(username: username, password: password);
      return result.isSignedIn ? (await _getUserIdFromAttributes()) : null;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signup({required String username, required String email, required String password}) async {
    print('attempting signup');
    final options = CognitoSignUpOptions(userAttributes: {CognitoUserAttributeKey.email: email});
    try {
      final result = await Amplify.Auth.signUp(username: username, password: password, options: options);
      return result.isSignUpComplete;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> confirmSignup({required String username, required String confirmationCode}) async {
    print('attempting confirm signup');
    try {
      final result = await Amplify.Auth.confirmSignUp(username: username, confirmationCode: confirmationCode);
      print(result.toString());
      // return result.isSignUpComplete ? (await _getUserIdFromAttributes()) : null;
      print('vi kom hertil 1');
      return result.isSignUpComplete;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signout() async {
    print('attempting signout');
    await Amplify.Auth.signOut();
  }
}
