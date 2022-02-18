class AuthRepository {
  Future<String> attemptAutoLogin() async {
    print('attempting autologin');
    await Future.delayed(Duration(seconds: 2));
    throw Exception('Failed autologin');
    print('we are autologged in');
    // return 'userId';
  }

  Future<String> login({required String username, required String password}) async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 2));
    print('we are logged in');
    return 'userId';
    // throw Exception('Failed login');
  }

  Future<void> signup({required String username, required String email, required String password}) async {
    print('attempting signup');
    await Future.delayed(Duration(seconds: 2));
    print('we are signing up');
    // throw Exception('Failed login');
  }

  Future<String> confirmSignup({required String username, required String confirmationCode}) async {
    print('attempting confirm signup');
    await Future.delayed(Duration(seconds: 2));
    print('we are signed up');
    return 'userId';
    // throw Exception('Failed login');
  }

  Future<void> signout() async {
    print('attempting signout');
    await Future.delayed(Duration(seconds: 2));
    print('we are signed out');
    // throw Exception('Failed login');
  }
}
