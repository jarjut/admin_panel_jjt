import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../utils/media_query_util.dart';
import '../../widgets/responsive_widget.dart';
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
        drawer: mediaQuery.width <= kTabletBreakpoint
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
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
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
                    ),
                  ),
                  Positioned.fill(
                    child: SingleChildScrollView(
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: mediaQuery.width <= kTabletBreakpoint
                                ? mobileHorizontalPadding
                                : desktopHorizontalPadding,
                            vertical: mediaQuery.width <= kTabletBreakpoint
                                ? mobileVerticalPadding
                                : desktopVerticalPadding,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Header(),
                              const SizedBox(height: 20.0),
                              body,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
