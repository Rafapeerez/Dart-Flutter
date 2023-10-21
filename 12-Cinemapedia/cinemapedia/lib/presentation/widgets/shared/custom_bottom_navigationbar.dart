import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      fixedColor: colors.primary,
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
