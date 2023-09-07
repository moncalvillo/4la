import 'package:app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/theme-changer',
      name: ThemeChangerScreen.name,
      builder: (context, state) => const ThemeChangerScreen(),
    ),
    GoRoute(
      path: '/nickname',
      name: NicknameScreen.name,
      builder: (context, state) => const NicknameScreen(),
    ),
    GoRoute(
      path: '/join-room',
      name: JoinRoomScreen.name,
      builder: (context, state) => const JoinRoomScreen(),
    ),
    GoRoute(
      path: '/waiting-room/:roomId', // <- Nota el parámetro :roomId
      name: WaitingRoomScreen.name,
      builder: (context, state) {
        // Aquí capturas el valor del parámetro roomId desde el state
        final roomId = state.pathParameters['roomId'] ?? "";
        return WaitingRoomScreen(
            roomId); // Asegúrate de que tu pantalla acepte un parámetro roomId
      },
    ),
  ],
);
