abstract class AuthState {
  bool get isLoggedIn;
  Stream<dynamic> get authStateStream;
}
