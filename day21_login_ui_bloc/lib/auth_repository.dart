class AuthRepository {
  Future<void> login() async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 2));
    print('we are logged in');
    throw Exception('Failed login');
  }
}
