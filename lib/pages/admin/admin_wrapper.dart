import 'package:admin_panel_jjt/utils/media_query_util.dart';
import 'package:admin_panel_jjt/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'widgets/app_drawer.dart';
import 'widgets/header.dart';

class AdminWrapper extends StatelessWidget {
  const AdminWrapper({
    Key? key,
    this.title = 'Dashboard',
    required this.body,
  }) : super(key: key);

  /// A one-line description of this app for use in the window manager.
  final String title;

  /// The primary content of the Admin Page.
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryUtil(context);

    const double mobileHorizontalPadding = 18.0;
    const double mobileVerticalPadding = 8.0;

    const double desktopHorizontalPadding = 36.0;
    const double desktopVerticalPadding = 20.0;

    return Title(
      color: Theme.of(context).primaryColor,
      title: '$title | $kAppTitle',
      child: Scaffold(
        drawer: mediaQuery.isTablet
            ? const AppDrawer(
                normalWidth: 300,
                collapsible: false,
              )
            : null,
        body: Row(
          children: [
            const ResponsiveWidget(
              mobileWidget: SizedBox.shrink(),
              smallDesktopWidget: AppDrawer(
                isCollapsed: true,
                normalWidth: 188,
              ),
              desktopWidget: AppDrawer(),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.width <= kTabletBreakpoint
                      ? mobileHorizontalPadding
                      : desktopHorizontalPadding,
                  vertical: mediaQuery.width <= kTabletBreakpoint
                      ? mobileVerticalPadding
                      : desktopVerticalPadding,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor.withAlpha(30),
                      Theme.of(context).accentColor.withAlpha(30),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(),
                    const SizedBox(height: 24.0),
                    Expanded(
                      child: body,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
