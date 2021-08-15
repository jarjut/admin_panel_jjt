import 'package:flutter/material.dart';

import 'admin_wrapper.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AdminWrapper(
      title: 'Dashboard',
      body: Text('Dashboard'),
    );
  }
}
