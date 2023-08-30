import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Cambiar tema',
    subTitle: 'Cambiar tema de la aplicación',
    link: '/theme-changer',
    icon: Icons.color_lens_outlined,
  ),
  MenuItem(
    title: 'Cambiar nickname',
    subTitle: 'Cambiar el nombre de usuario',
    link: '/nickname',
    icon: Icons.person_outlined,
  ),
  MenuItem(
    title: 'Crear sala',
    subTitle: 'Crea una nueva sala para jugar',
    link: '/create-room',
    icon: Icons.create_outlined,
  ),
  MenuItem(
    title: 'Unirse a sala',
    subTitle: 'Unete a una sala existente',
    link: '/join-room',
    icon: Icons.group_outlined,
  ),
];
