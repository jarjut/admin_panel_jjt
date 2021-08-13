import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

const String kAccesToken = 'accessToken';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final SharedPreferences sharedPrefs;
  final _controller = StreamController<AuthenticationStatus>();

  AuthenticationRepository({required this.sharedPrefs});

  Stream<AuthenticationStatus> get authStatus async* {
    yield hasToken()
        ? AuthenticationStatus.authenticated
        : AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    // Dummy Login
    await Future.delayed(const Duration(seconds: 1));
    if (username == 'admin' && password == 'admin') {
      saveToken('token');
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      throw ('Invalid Credential');
    }
  }

  Future<User> getUser() async {
    // Dummy Get User
    return const User(username: 'admin', name: 'Admin');
  }

  Future<void> signOut() async {
    deleteToken(kAccesToken);
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() {
    _controller.close();
  }

  // =========== Token ==============

  void saveToken(String token) {
    sharedPrefs.setString(kAccesToken, token);
  }

  bool hasToken() {
    final token = sharedPrefs.getString(kAccesToken);
    return token != null;
  }

  void deleteToken(String token) {
    sharedPrefs.remove(kAccesToken);
  }
}
