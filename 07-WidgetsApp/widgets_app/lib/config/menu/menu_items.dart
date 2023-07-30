import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Buttons', 
    subtitle: 'Some Flutter buttons', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined,
  ),

  MenuItems(
    title: 'Cards', 
    subtitle: 'Some Flutter cards', 
    link: '/cards', 
    icon: Icons.credit_card,
  ),
];
