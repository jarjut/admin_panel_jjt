import 'package:admin_panel_jjt/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Dashboard'),
            ElevatedButton(
              onPressed: () =>
                  RepositoryProvider.of<AuthenticationRepository>(context)
                      .signOut(),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
