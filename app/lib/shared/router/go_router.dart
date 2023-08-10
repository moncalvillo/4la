import 'package:app/presentation/pages/pages.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/nickname",
  routes: [
    GoRoute(
      path: '/nickname',
      name: NicknamePage.name,
      builder: (context, state) => const NicknamePage(),
    ),
    GoRoute(
      path: '/',
      name: HomePage.name,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/join-room',
      name: JoinRoomPage.name,
      builder: (context, state) => const JoinRoomPage(),
    ),
  ],
);
