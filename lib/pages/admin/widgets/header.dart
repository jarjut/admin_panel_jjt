import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/authentication_repository.dart';
import '../../../widgets/responsive_preferred_widget.dart';
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
          ResponsivePreferredWidget(
            mobile: true,
            tablet: true,
            child: Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 24.0,
                color: Theme.of(context).primaryColor,
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu),
              ),
            ),
          ),
          ResponsivePreferredWidget(
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
          PopupMenuButton(
            child: const CircleAvatar(
              child: Icon(Icons.person),
              maxRadius: 16,
            ),
            tooltip: null,
            offset: const Offset(-4, 36),
            onSelected: (int index) {
              if (index == 0) {
                RepositoryProvider.of<AuthenticationRepository>(context)
                    .signOut();
              }
            },
            itemBuilder: (context) {
              return <PopupMenuItem<int>>[
                const PopupMenuItem(
                  value: 0,
                  child: Text('Logout'),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
