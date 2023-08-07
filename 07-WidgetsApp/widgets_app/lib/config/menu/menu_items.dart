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

  MenuItems(
    title: 'Progress Indicator', 
    subtitle: 'Some general and controlled indicators', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),

  MenuItems(
    title: 'SnackBars', 
    subtitle: 'Some screen indicators', 
    link: '/snackbars', 
    icon: Icons.info
  ),

  MenuItems(
    title: 'Animated Container', 
    subtitle: 'Animated Statefull Widget', 
    link: '/animated', 
    icon: Icons.auto_fix_normal_outlined
  ),

  MenuItems(
    title: 'UI - Controls', 
    subtitle: 'Some Flutter controls', 
    link: '/ui-controls', 
    icon: Icons.car_crash_outlined
  ),
];
