import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/bloc/authentication_bloc.dart';
import 'repositories/authentication_repository.dart';

void main() async {
  final authRepository = AuthenticationRepository();

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
