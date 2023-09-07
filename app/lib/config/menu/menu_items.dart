import 'package:app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;
  final Function(BuildContext)? onTap;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon,
      this.onTap});
}

final appMenuItems = <MenuItem>[
  const MenuItem(
    title: 'Cambiar tema',
    subTitle: 'Cambiar tema de la aplicación',
    link: '/theme-changer',
    icon: Icons.color_lens_outlined,
  ),
  const MenuItem(
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
    onTap: (context) {
      socketService.createRoomWithCallback((roomId) {
        context.push('/waiting-room/$roomId');
      });
    },
  ),
  const MenuItem(
    title: 'Unirse a sala',
    subTitle: 'Unete a una sala existente',
    link: '/join-room',
    icon: Icons.group_outlined,
  ),
];
