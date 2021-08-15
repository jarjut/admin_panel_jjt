import 'package:flutter/material.dart';

import '../../../widgets/responsive_only_widget.dart';
import '../../../widgets/responsive_widget.dart';
import 'header_search_field.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0,
      child: Row(
        children: [
          ResponsiveOnlyWidget(
            desktop: true,
            smallDesktop: true,
            child: Expanded(
              child: Text(
                'Good Evening Admin!',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          const ResponsiveWidget(
            mobileWidget: Expanded(
              child: HeaderSearchField(),
            ),
            smallDesktopWidget: SizedBox(
              width: 200,
              child: HeaderSearchField(),
            ),
          ),
          const SizedBox(width: 16.0),
          IconButton(
            splashRadius: 28,
            onPressed: () {},
            icon: Icon(
              Icons.notifications_active_outlined,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            splashRadius: 28,
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(width: 8.0),
          const CircleAvatar(
            child: Icon(Icons.person),
            maxRadius: 16,
          ),
        ],
      ),
    );
  }
}
