import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardPieChartTwo extends StatelessWidget {
  const DashboardPieChartTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String data1Title = 'Data 1';
    final Color data1Color = Theme.of(context).primaryColor;
    const double data1Value = 30;

    const String data2Title = 'Data 2';
    final Color data2Color = Theme.of(context).accentColor;
    const double data2Value = 70;

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      elevation: 32.0,
      shadowColor: Theme.of(context).primaryColor.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      startDegreeOffset: 45,
                      sections: [
                        PieChartSectionData(
                          showTitle: false,
                          color: data1Color,
                          value: data1Value,
                          radius: 20,
                        ),
                        PieChartSectionData(
                          showTitle: false,
                          color: data2Color,
                          value: data2Value,
                          radius: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(36.0)),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Icon(
                      Icons.wallet_giftcard,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Wrap(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data1Color,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    const Text(data1Title),
                  ],
                ),
                const SizedBox(width: 8.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data2Color,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    const Text(data2Title),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
