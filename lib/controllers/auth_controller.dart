import '../models/user.dart';
import 'base_controller.dart';

class AuthController extends BaseController {
  User? _currentUser;
  bool _isAuthenticated = false;

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;

  Future<bool> authenticateUser(String email, String password) async {
    return await handleAsyncOperation(() async {
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email and password are required');
      }

      if (!email.contains('@')) {
        throw Exception('Please enter a valid email');
      }

      if (password.length < 6) {
        throw Exception('Password must be at least 6 characters');
      }

      _currentUser = User(
        name: email.split('@')[0],
        email: email,
        password: password,
      );
      _isAuthenticated = true;
      return true;
    });
  }

  Future<bool> registerUser(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    return await handleAsyncOperation(() async {
      if (name.isEmpty || email.isEmpty || password.isEmpty) {
        throw Exception('All fields are required');
      }

      if (!email.contains('@')) {
        throw Exception('Please enter a valid email');
      }

      if (password != confirmPassword) {
        throw Exception('Passwords do not match');
      }

      if (password.length < 6) {
        throw Exception('Password must be at least 6 characters');
      }

      _currentUser = User(name: name, email: email, password: password);
      _isAuthenticated = true;
      return true;
    });
  }

  void logout() {
    _currentUser = null;
    _isAuthenticated = false;
    clearError();
    notifyListeners();
  }

  bool checkAuthStatus() {
    return _isAuthenticated && _currentUser != null;
  }

  String get userDisplayName {
    return _currentUser?.name ?? 'Guest';
  }

  String get userEmail {
    return _currentUser?.email ?? '';
  }
}
