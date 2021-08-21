import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardLineChart extends StatelessWidget {
  const DashboardLineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> dataColors = [
      Theme.of(context).primaryColor,
      Theme.of(context).accentColor,
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sales Income',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 24.0),
          Expanded(
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 100,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.3),
                      strokeWidth: 0.5,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) =>
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 2:
                          return 'Feb';
                        case 4:
                          return 'Apr';
                        case 6:
                          return 'Jun';
                        case 8:
                          return 'Aug';
                        case 10:
                          return 'Okt';
                        case 12:
                          return 'Dec';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) =>
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 100:
                          return '\$100';
                        case 200:
                          return '\$200';
                        case 300:
                          return '\$300';
                        case 400:
                          return '\$400';

                        default:
                          return '';
                      }
                    },
                  ),
                ),
                minX: 1,
                maxX: 12,
                minY: 0,
                maxY: 400,
                lineTouchData: LineTouchData(
                  getTouchedSpotIndicator: (barData, indicators) {
                    return indicators.map((int index) {
                      return TouchedSpotIndicatorData(
                        FlLine(
                          strokeWidth: 0.0,
                        ),
                        FlDotData(
                          getDotPainter: (spot, percent, bar, index) {
                            return FlDotCirclePainter(
                              color: barData.colors[0],
                              radius: 4.0,
                            );
                          },
                        ),
                      );
                    }).toList();
                  },
                ),
                lineBarsData: [
                  LineChartBarData(
                    // isCurved: true,
                    colors: dataColors,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      colors: dataColors
                          .map((color) => color.withOpacity(0.1))
                          .toList(),
                    ),
                    spots: [
                      FlSpot(1, 120),
                      FlSpot(2, 230),
                      FlSpot(3, 280),
                      FlSpot(4, 200),
                      FlSpot(5, 320),
                      FlSpot(6, 240),
                      FlSpot(7, 160),
                      FlSpot(8, 150),
                      FlSpot(9, 100),
                      FlSpot(10, 80),
                      FlSpot(11, 120),
                      FlSpot(12, 190),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
