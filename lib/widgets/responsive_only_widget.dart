import 'package:admin_panel_jjt/utils/media_query_util.dart';
import 'package:flutter/material.dart';

class ResponsiveOnlyWidget extends StatelessWidget {
  const ResponsiveOnlyWidget({
    Key? key,
    required this.child,
    this.mobile = false,
    this.tablet = false,
    this.smallDesktop = false,
    this.desktop = false,
  }) : super(key: key);

  final Widget child;
  final bool mobile;
  final bool tablet;
  final bool smallDesktop;
  final bool desktop;

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
