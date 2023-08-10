import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String? subtitle;
  final String route;
  final IconData icon;

  const MenuItem({
    required this.title,
    this.subtitle,
    required this.route,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: "Cambiar nombre", route: "/nickname", icon: Icons.create_rounded),
  MenuItem(title: "Crear sala", route: "/new-room", icon: Icons.create_rounded),
  MenuItem(
      title: "Unirme a sala",
      route: "/join-room",
      icon: Icons.join_full_outlined),
];
