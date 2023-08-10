import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0; //Control selected option

  @override
  Widget build(BuildContext context) {
    final hasNotch =
        MediaQuery.of(context).viewPadding.top > 35; // For mobil with notch

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
            child: const Text('Menu')),
        ...appMenuItems.sublist(0, 3).map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), label: Text(item.title))),
        const Padding(
          //Divider
          padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Divider(),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
            child: const Text('More options')),
        ...appMenuItems.sublist(3).map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), label: Text(item.title))),
      ],
    );
  }
}
