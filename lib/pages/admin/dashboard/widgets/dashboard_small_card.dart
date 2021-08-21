import 'package:flutter/material.dart';

class DashboardSmallCard extends StatelessWidget {
  final Widget icon;
  final Color iconColor;
  final String title;
  final String number;
  final String number2;

  const DashboardSmallCard({
    Key? key,
    this.icon = const Icon(
      Icons.money,
      color: Colors.white,
    ),
    this.title = 'Title',
    this.number = '\$0.00',
    this.number2 = '0.0%',
    this.iconColor = Colors.purple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      elevation: 32.0,
      shadowColor: Theme.of(context).primaryColor.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: icon,
            ),
            const SizedBox(height: 24.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              number,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              number2,
              style: const TextStyle(
                fontSize: 9.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
