import 'dart:async';
import 'token_manager.dart';

class SessionManager {
  final TokenManager _tokenManager;
  String? _authToken;

  SessionManager(this._tokenManager);

  // New: broadcast auth state updates
  final _authStateController = StreamController<bool>.broadcast();
  Stream<bool> get authStateStream => _authStateController.stream;

  Future<void> init() async {
    _authToken = await _tokenManager.loadToken();
    _emitAuthChanged();
  }

  String? get token => _authToken;

  Future<void> setToken(String token) async {
    _authToken = token;
    await _tokenManager.saveToken(token);
    _emitAuthChanged();
  }

  Future<void> clearSession() async {
    _authToken = null;
    await _tokenManager.clearToken();
    _emitAuthChanged();
  }

  bool get isLoggedIn => _authToken != null;

  void _emitAuthChanged() {
    if (!_authStateController.isClosed) {
      _authStateController.add(isLoggedIn);
    }
  }

  Future<void> dispose() async {
    await _authStateController.close();
  }
}
