import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'routes.dart';
import 'theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      themeMode: ThemeMode.light,
      theme: appTheme(),
      darkTheme: darkTheme(),
      routes: [AppRoutes(context)],
    );
  }
}
