import 'package:animate_do/animate_do.dart';
import 'package:app/config/menu/menu_items.dart';
import 'package:app/presentation/providers/nickname_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

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
            padding: EdgeInsets.fromLTRB(16, hasNotch ? 0 : 20, 16, 10),
            child: const _ProfileDataLabel(),
          ),
          ...appMenuItems.sublist(0, 2).map(
                (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  label: Text(item.title),
                ),
              ),
        ]);
  }
}

class _ProfileDataLabel extends ConsumerWidget {
  const _ProfileDataLabel({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;

    final nickname = ref.watch(nicknameProvider);
    return BounceInRight(
      duration: const Duration(seconds: 1),
      delay: const Duration(milliseconds: 200),
      child: FilledButton.icon(
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          ),
          onPressed: () {},
          icon: Icon(
            Icons.person,
            color: colors.background,
          ),
          label: Text(nickname ?? 'Anónimo',
              style: TextStyle(color: colors.background))),
    );
  }
}
