import 'token_manager.dart';

class SessionManager {
  final TokenManager _tokenManager;
  String? _authToken;

  SessionManager(this._tokenManager);

  Future<void> init() async {
    _authToken = await _tokenManager.loadToken();
  }

  String? get token => _authToken;

  Future<void> setToken(String token) async {
    _authToken = token;
    await _tokenManager.saveToken(token);
  }

  Future<void> clearSession() async {
    _authToken = null;
    await _tokenManager.clearToken();
  }

  bool get isLoggedIn => _authToken != null;
}
