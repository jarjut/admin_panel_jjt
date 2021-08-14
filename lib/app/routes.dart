import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../pages/authentication/login_page.dart';
import '../pages/admin/dashboard_page.dart';
import '../repositories/authentication_repository.dart';
import 'bloc/authentication_bloc.dart';

class AppRoutes extends VRouteElementBuilder {
  final BuildContext context;

  AppRoutes(this.context);

  bool get isAuthenticated =>
      BlocProvider.of<AuthenticationBloc>(context).state.status ==
      AuthenticationStatus.authenticated;

  static const String loginRoute = 'loginRoute';
  static const String dashboardRoute = 'dashboardRoute';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VNester(
        path: null,
        widgetBuilder: (child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state.status == AuthenticationStatus.authenticated) {
                // redirect to main page
                VRouter.of(context).to('/');
              }
              if (state.status == AuthenticationStatus.unauthenticated) {
                VRouter.of(context).to('/login');
              }
            },
            child: child,
          );
        },
        nestedRoutes: [
          VGuard(
            beforeEnter: (vRedirector) async =>
                isAuthenticated ? vRedirector.to('/') : null,
            stackedRoutes: [
              VWidget(
                path: '/login',
                name: loginRoute,
                widget: const LoginPage(),
              ),
            ],
          ),
          VGuard(
            beforeEnter: (vRedirector) async =>
                !isAuthenticated ? vRedirector.to('/login') : null,
            stackedRoutes: [
              VWidget(
                path: '/',
                name: dashboardRoute,
                widget: const DashboardPage(),
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
