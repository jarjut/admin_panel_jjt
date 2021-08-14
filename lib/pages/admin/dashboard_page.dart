import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'widgets/app_drawer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Theme.of(context).primaryColor,
      title: 'Dashboard | $kAppTitle',
      child: Scaffold(
        body: Row(
          children: [
            const AppDrawer(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 36.0, vertical: 20.0),
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
                  children: [
                    SizedBox(
                      height: kToolbarHeight,
                      child: Row(
                        children: const [
                          Expanded(child: Text('Title')),
                          Icon(Icons.settings),
                          Icon(Icons.settings),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text('Dashboard'),
                      ),
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
