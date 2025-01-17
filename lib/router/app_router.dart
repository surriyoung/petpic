import 'package:go_router/go_router.dart';
import 'package:petpic/home/view/home_screen.dart';
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'HomeScreen',
      builder: (context, state) {
        return HomeScreen();
      },
      // routes: [

      // ]
    )
  ]
);