import 'package:flutter/material.dart';

class DashboardCardChip extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String number;

  const DashboardCardChip({
    Key? key,
    this.iconData = Icons.flutter_dash,
    this.title = 'title',
    this.number = '0',
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
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(iconData),
            const SizedBox(width: 12.0),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Text(number),
          ],
        ),
      ),
    );
  }
}
