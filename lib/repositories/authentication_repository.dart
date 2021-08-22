import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

const String kAccesToken = 'accessToken';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  AuthenticationRepository();

  Stream<AuthenticationStatus> get authStatus async* {
    yield await hasToken()
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
      await saveToken('token');
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
    await deleteToken(kAccesToken);
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() {
    _controller.close();
  }

  // =========== Token ==============

  Future<void> saveToken(String token) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString(kAccesToken, token);
  }

  Future<bool> hasToken() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final token = sharedPrefs.getString(kAccesToken);
    return token != null;
  }

  Future<void> deleteToken(String token) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.remove(kAccesToken);
  }
}
