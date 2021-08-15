import 'package:admin_panel_jjt/pages/admin/admin_wrapper.dart';
import 'package:admin_panel_jjt/pages/admin/widgets/header.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'widgets/app_drawer.dart';

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
