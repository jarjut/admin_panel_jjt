import 'package:flutter/material.dart';

import '../utils/media_query_util.dart';

class ResponsiveWidget extends StatelessWidget {
  /// Widget for mobile screen
  final Widget mobileWidget;

  /// Widget for tablet screen
  final Widget? tabletWidget;

  /// Widget for small desktop screen
  final Widget? smallDesktopWidget;

  /// Widget for desktop screen
  final Widget? desktopWidget;

  /// Creates a widget that returns a widget based on the device screen
  ///
  /// When the widget representing the displayed device screen is `null`,
  /// it returns the widget with a smaller screen
  ///
  /// e.g. on the tablet device when [tabletWidget] is null,
  /// it will return [mobileWidget]
  const ResponsiveWidget({
    Key? key,
    required this.mobileWidget,
    this.tabletWidget,
    this.smallDesktopWidget,
    this.desktopWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryUtil(context);

    if (mediaQuery.isDesktop && desktopWidget != null) {
      return desktopWidget!;
    } else if (mediaQuery.isSmallDesktop && smallDesktopWidget != null) {
      return smallDesktopWidget!;
    } else if (mediaQuery.isTablet && tabletWidget != null) {
      return tabletWidget!;
    } else {
      return mobileWidget;
    }
  }
}
