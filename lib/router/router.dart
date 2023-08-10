import 'package:demo_calendar/view/add_screen.dart';
import 'package:demo_calendar/view/home_screen.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  home(name: 'home', path: '/'),
  add(name: 'add', path: 'add');

  const Routes({required this.name, required this.path});

  final String name;
  final String path;
}

final router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.home.name,
      path: Routes.home.path,
      routes: [
        GoRoute(
          name: Routes.add.name,
          path: Routes.add.path,
          builder: (context, state) => const AddScreen(),
        ),
      ],
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
