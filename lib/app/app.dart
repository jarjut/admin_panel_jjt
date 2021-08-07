import 'package:admin_panel_jjt/app/routes.dart';
import 'package:admin_panel_jjt/app/theme.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: appTheme(),
      routes: [AppRoutes(context)],
    );
  }
}
