import 'package:arch/src/auth_module/user_model.dart';
import 'dart:async';

class AuthState {
  StreamController _streamController = new StreamController<User>.broadcast();
  Stream get onAuthStateChanged => _streamController.stream;

  static AuthState instance = new AuthState._();
  AuthState._();

  setUser(user) {
    AuthState.currentUser = user;
    _streamController.add(user);
  }

  static User currentUser;
}
