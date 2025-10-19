import 'package:clean_architecture/core/navigation/auth_state.dart';
import 'package:clean_architecture/core/session/session_manager.dart';

class AuthStateAdapter implements AuthState {
  AuthStateAdapter(this._session);

  final SessionManager _session;

  @override
  bool get isLoggedIn => _session.isLoggedIn; // or: _session.isAuthenticated

  @override
  Stream<dynamic> get authStateStream => _session.authStateStream;
}
