import 'package:admin_panel_jjt/utils/media_query_util.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobileWidget;
  final Widget? tabletWidget;
  final Widget? desktopWidget;

  const ResponsiveWidget(
      {Key? key,
      required this.mobileWidget,
      this.tabletWidget,
      this.desktopWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryUtil(context);

    if (mediaQuery.isDesktop && desktopWidget != null) {
      return desktopWidget!;
    } else if (mediaQuery.isTablet && tabletWidget != null) {
      return tabletWidget!;
    } else {
      return mobileWidget;
    }
  }
}
