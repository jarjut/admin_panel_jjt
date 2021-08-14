import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key? key,
    this.collapsible = true,
    this.isCollapsed = false,
  }) : super(key: key);

  final bool collapsible;
  final bool isCollapsed;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  double drawerNormalWidth = 228;
  double drawerCollapsedWidth = 64;
  late bool isCollapsed;
  late bool showTitle;

  @override
  void initState() {
    isCollapsed = widget.isCollapsed;
    showTitle = !isCollapsed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isCollapsed ? drawerCollapsedWidth : drawerNormalWidth,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
      onEnd: () {
        setState(() {
          showTitle = !isCollapsed;
        });
      },
      child: SafeArea(
        child: Drawer(
          child: IconTheme(
            data: const IconThemeData(
              size: 28.0,
            ),
            child: ListTileTheme(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 32.0,
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const FlutterLogo(),
                              showTitle
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Text(
                                        'Admin',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.dashboard),
                          title: showTitle ? const Text('Dashboard') : null,
                          selected: true,
                        ),
                        ListTile(
                          leading: const Icon(Icons.dashboard),
                          title: showTitle ? const Text('Dashboard') : null,
                        ),
                        ListTile(
                          leading: const Icon(Icons.dashboard),
                          title: showTitle ? const Text('Dashboard') : null,
                        ),
                      ],
                    ),
                  ),
                  widget.collapsible
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Divider(),
                            Container(
                              width: double.infinity,
                              alignment: isCollapsed
                                  ? Alignment.center
                                  : Alignment.centerRight,
                              child: IconButton(
                                iconSize: 32.0,
                                color: Theme.of(context).primaryColorDark,
                                onPressed: () {
                                  setState(() {
                                    isCollapsed = !isCollapsed;
                                    if (isCollapsed) {
                                      showTitle = false;
                                    }
                                  });
                                },
                                icon: isCollapsed
                                    ? const Icon(Icons.chevron_right)
                                    : const Icon(Icons.chevron_left),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
