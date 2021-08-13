import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'app/bloc/authentication_bloc.dart';
import 'repositories/authentication_repository.dart';

void main() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  final authRepository = AuthenticationRepository(sharedPrefs: sharedPrefs);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => authRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthenticationBloc(authenticationRepository: authRepository),
          ),
        ],
        child: const App(),
      ),
    ),
  );
}
