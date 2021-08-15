import 'package:admin_panel_jjt/constants/constants.dart';
import 'package:flutter/material.dart';

class MediaQueryUtil {
  final BuildContext context;
  final MediaQueryData mediaQuery;

  MediaQueryUtil(this.context) : mediaQuery = MediaQuery.of(context);

  /// Get the screen size
  Size get size => mediaQuery.size;

  /// Get the screen width
  double get width => size.width;

  ///' Get the screen height
  double get height => size.height;

  /// return `true` if screen width is less or equal than [kMobileBreakpoint]
  bool get isMobile => width <= kMobileBreakpoint;

  /// return `true` if screen width is more than [kMobileBreakpoint]
  bool get isTablet => width > kMobileBreakpoint;

  /// return `true` if screen width is more than [kTabletBreakpoint]
  bool get isSmallDesktop => width > kTabletBreakpoint;

  /// return `true` if screen width is more than [kSmallDesktopBreakpoint]
  bool get isDesktop => width > kSmallDesktopBreakpoint;
}
