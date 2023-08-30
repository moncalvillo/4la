import 'package:app/config/menu/menu_items.dart';
import 'package:app/presentation/providers/nickname_provider.dart';
import 'package:app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final nickname = ref.read(nicknameProvider);

    if (nickname?.isEmpty ?? true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/nickname');
      });
    }
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('4la'),
          centerTitle: true,
        ),
        body: const _HomeView(),
        endDrawer: SideMenu(scaffoldKey: scaffoldKey));
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final items = appMenuItems.sublist(2);
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final menuItem = items[index];

        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}
