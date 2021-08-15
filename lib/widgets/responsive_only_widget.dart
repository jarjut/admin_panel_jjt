import 'package:admin_panel_jjt/utils/media_query_util.dart';
import 'package:flutter/material.dart';

class ResponsiveOnlyWidget extends StatelessWidget {
  /// The widget to display on desired screen
  final Widget child;

  /// Show widget on mobile screen
  final bool mobile;

  /// Show widget on tablet screen
  final bool tablet;

  /// Show widget on small desktop screen
  final bool smallDesktop;

  /// Show widget on desktop screen
  final bool desktop;

  /// Return a widget only on desired screen
  const ResponsiveOnlyWidget({
    Key? key,
    required this.child,
    this.mobile = false,
    this.tablet = false,
    this.smallDesktop = false,
    this.desktop = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryUtil(context);

    if (mediaQuery.isDesktop) {
      return desktop ? child : const SizedBox.shrink();
    } else if (mediaQuery.isSmallDesktop) {
      return smallDesktop ? child : const SizedBox.shrink();
    } else if (mediaQuery.isTablet) {
      return tablet ? child : const SizedBox.shrink();
    } else {
      return mobile ? child : const SizedBox.shrink();
    }
  }
}
