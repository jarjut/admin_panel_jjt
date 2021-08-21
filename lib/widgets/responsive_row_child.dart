import 'package:admin_panel_jjt/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

import 'responsive_row.dart';

class ResponsiveRowChild extends StatelessWidget {
  /// The [child] contained by the flex responsive
  final Widget child;

  /// How many column this widget takes in mobile screen
  final int mobileSize;

  /// How many column this widget takes in tablet screen
  final int tabletSize;

  /// How many column this widget takes in smallDesktop screen
  final int smallDesktopSize;

  /// How many column this widget takes in desktop screen
  final int desktopSize;

  /// Use this widget inside [ResponsiveRow] widget
  const ResponsiveRowChild({
    Key? key,
    required this.child,
    this.mobileSize = 12,
    this.tabletSize = 6,
    this.smallDesktopSize = 2,
    this.desktopSize = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = ResponsiveRowSettings.of(context);
    if (settings == null) {
      throw 'ResponsiveRow not detected in parent widget';
    }

    return ResponsiveWidget(
      mobileWidget: builder(settings, mobileSize),
      tabletWidget: builder(settings, tabletSize),
      smallDesktopWidget: builder(settings, smallDesktopSize),
      desktopWidget: builder(settings, desktopSize),
    );
  }

  LayoutBuilder builder(ResponsiveRowSettings settings, int size) {
    if (size > settings.columnCount) {
      throw 'child size is larger than available column';
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return SizedBox(
          width: size * (maxWidth / settings.columnCount) - settings.spacing,
          child: child,
        );
      },
    );
  }
}
