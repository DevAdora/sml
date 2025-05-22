class AuthRemoteDataSource {
  Future<Map<String, dynamic>?> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    if (email == 'test@test.com' && password == '1234') {
      return { 'email': email };
    }
    return null; 
  }
}
