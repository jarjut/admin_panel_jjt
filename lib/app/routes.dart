import 'package:flutter/cupertino.dart';
import 'package:vrouter/vrouter.dart';

import '../pages/dashboard_page.dart';

class AppRoutes extends VRouteElementBuilder {
  final BuildContext context;

  AppRoutes(this.context);

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VWidget(
        path: '/',
        widget: DashboardPage(),
      ),
    ];
  }
}
