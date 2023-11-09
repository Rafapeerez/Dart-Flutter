import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});


  int getCurrentIndex( BuildContext context ) {
    final String location = GoRouterState.of(context).matchedLocation;

    switch (location) {
      case '/':
        return 0;

      case '/categories':
        return 1;
        
      case '/favourites':
        return 2;
      
      default:
        return 0;
    }
  } 

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
      break;

      case 1:
        context.go('/');
      break;

      case 2:
        context.go('/favourites');
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      fixedColor: colors.primary,
      currentIndex: getCurrentIndex(context),
      onTap: (value) => onItemTapped( context,value ), //Route to he view
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_rounded), 
          label: 'Categorias'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite), 
          label: 'Favoritos'
        ),
      ],
    );
  }
}
