import 'package:admin_panel_jjt/constants/constants.dart';
import 'package:flutter/material.dart';

class MediaQueryUtil {
  final BuildContext context;
  final MediaQueryData mediaQuery;

  MediaQueryUtil(this.context) : mediaQuery = MediaQuery.of(context);

  Size get size => mediaQuery.size;

  double get width => size.width;

  double get height => size.height;

  bool get isMobile => width < kMobileBreakpoint;

  bool get isTablet => width > kMobileBreakpoint;

  bool get isDesktop => width > kTabletBreakpoint;
}
