import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screen/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screen/cards/cards_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      /* physics: const BouncingScrollPhysics(), */
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final MenuItems menuItem = appMenuItems[index];

        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItems menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
        /* FIRST OPTION TO ROUTE */
        /* Navigator.of(context).push( //Exists push, pop, replace ...(documentation)
            MaterialPageRoute(
              builder: (context) => const ButtonsScreen()   
            )
          ); */

        /* SECOND OPTION TO ROUTE */
        /* Navigator.pushNamed(context, menuItem.link); */

        /* THIRD AND BEST OPTION (ACCORDING TO DOCUMENTATION) TO ROUTE */
        context.push(menuItem.link);
        //context.pushNamed(CardsScreen.name);
      },
    );
  }
}
