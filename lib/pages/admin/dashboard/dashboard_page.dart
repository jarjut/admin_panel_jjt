import 'package:flutter/material.dart';

import '../../../widgets/responsive_row.dart';
import '../../../widgets/responsive_row_child.dart';
import '../../../widgets/responsive_widget.dart';
import '../admin_wrapper.dart';
import 'widgets/dashboard_card_chip.dart';
import 'widgets/dashboard_line_chart.dart';
import 'widgets/dashboard_pie_chart_one.dart';
import 'widgets/dashboard_pie_chart_two.dart';
import 'widgets/dashboard_service_card.dart';
import 'widgets/dashboard_small_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminWrapper(
      title: 'Dashboard',
      body: ResponsiveRow(
        spacing: 8.0,
        runSpacing: 16.0,
        children: [
          ResponsiveRowChild(
            mobileSize: 12,
            tabletSize: 12,
            smallDesktopSize: 7,
            desktopSize: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ResponsiveRow(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    ResponsiveRowChild(
                      mobileSize: 6,
                      tabletSize: 3,
                      smallDesktopSize: 3,
                      desktopSize: 3,
                      child: DashboardSmallCard(
                        icon: Icon(
                          Icons.money,
                          color: Colors.white,
                        ),
                        iconColor: Colors.purple,
                        title: 'This Week',
                        number: '\$3.45k',
                        number2: '+ 6.4%',
                      ),
                    ),
                    ResponsiveRowChild(
                      mobileSize: 6,
                      tabletSize: 3,
                      smallDesktopSize: 3,
                      desktopSize: 3,
                      child: DashboardSmallCard(
                        icon: Icon(
                          Icons.update,
                          color: Colors.white,
                        ),
                        iconColor: Colors.blueGrey,
                        title: 'This Month',
                        number: '\$12.9k',
                        number2: '- 3.1%',
                      ),
                    ),
                    ResponsiveRowChild(
                      mobileSize: 6,
                      tabletSize: 3,
                      smallDesktopSize: 3,
                      desktopSize: 3,
                      child: DashboardSmallCard(
                        icon: Icon(
                          Icons.upcoming,
                          color: Colors.white,
                        ),
                        iconColor: Colors.orange,
                        title: 'Upcoming',
                        number: '\$14.4k',
                        number2: '+ 10.3%',
                      ),
                    ),
                    ResponsiveRowChild(
                      mobileSize: 6,
                      tabletSize: 3,
                      smallDesktopSize: 3,
                      desktopSize: 3,
                      child: DashboardSmallCard(
                        icon: Icon(
                          Icons.upcoming,
                          color: Colors.white,
                        ),
                        iconColor: Colors.deepOrange,
                        title: 'Upcoming',
                        number: '\$14.4k',
                        number2: '+ 10.3%',
                      ),
                    ),
                  ],
                ),
                const ResponsiveWidget(
                  mobileWidget: SizedBox(height: 16.0),
                  smallDesktopWidget: SizedBox(height: 36.0),
                ),
                const ResponsiveRow(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    ResponsiveRowChild(
                      mobileSize: 12,
                      tabletSize: 6,
                      smallDesktopSize: 6,
                      desktopSize: 6,
                      child: DashboardServiceCard(
                        title: 'Junker & Bunker',
                        desc: 'Where a payment provider offers multiple types',
                        cost: '\$42.00/Mo',
                        iconData: Icons.note,
                      ),
                    ),
                    ResponsiveRowChild(
                      mobileSize: 12,
                      tabletSize: 6,
                      smallDesktopSize: 6,
                      desktopSize: 6,
                      child: DashboardServiceCard(
                        title: 'IPTV Service',
                        desc: 'Where a payment provider offers multiple types',
                        cost: '\$28.00/Mo',
                        iconData: Icons.tv,
                      ),
                    ),
                    ResponsiveRowChild(
                      mobileSize: 12,
                      tabletSize: 6,
                      smallDesktopSize: 6,
                      desktopSize: 6,
                      child: DashboardServiceCard(
                          title: 'Personal Insurances',
                          desc:
                              'Where a payment provider offers multiple types',
                          cost: '\$79.00/Mo',
                          iconData: Icons.shield),
                    ),
                    ResponsiveRowChild(
                      mobileSize: 12,
                      tabletSize: 6,
                      smallDesktopSize: 6,
                      desktopSize: 6,
                      child: DashboardServiceCard(
                        title: 'Internet & Phone',
                        desc: 'Where a payment provider offers multiple types',
                        cost: '\$29.00/Mo',
                        iconData: Icons.network_wifi,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ResponsiveRowChild(
            mobileSize: 12,
            tabletSize: 12,
            smallDesktopSize: 5,
            desktopSize: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 190.0,
                  child: DashboardLineChart(),
                ),
                const SizedBox(height: 16.0),
                Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: DashboardCardChip(
                            iconData: Icons.thumb_up_alt,
                            title: 'Likes',
                            number: '30',
                          ),
                        ),
                        Expanded(
                          child: DashboardCardChip(
                            iconData: Icons.attach_file,
                            title: 'Attachment',
                            number: '26',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: DashboardCardChip(
                            iconData: Icons.people,
                            title: 'Members',
                            number: '134',
                          ),
                        ),
                        Expanded(
                          child: DashboardCardChip(
                            iconData: Icons.vpn_key,
                            title: 'Credentials',
                            number: '84',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Expanded(
                      child: DashboardPieChartOne(),
                    ),
                    const Expanded(
                      child: DashboardPieChartTwo(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
