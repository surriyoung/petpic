import 'package:go_router/go_router.dart';
import 'package:petpic/community/view/community_detail_screen.dart';
import 'package:petpic/community/view/community_screen.dart';
import 'package:petpic/course/view/course_screen.dart';
import 'package:petpic/course/view/course_add_form_screen.dart';
import 'package:petpic/home/view/home_layout_screen.dart';
import 'package:petpic/home/view/home_screen.dart';
import 'package:petpic/my/view/my_screen.dart';
import 'package:petpic/search/view/search_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'HomeLayoutScreen',
      builder: (context, state) {
        return HomeLayoutScreen();
      },
      routes: [
        GoRoute(
          path: 'home_screen',
          name: 'HomeScreen',
          builder: (context, state) {
            return HomeScreen();
          },
        ),
        GoRoute(
          path: 'search_screen',
          name: 'SearchScreen',
          builder: (context, state) {
            return SearchScreen();
          },
        ),
        GoRoute(
          path: 'course_screen',
          name: 'CourseScreen',
          builder: (context, state) {
            return CourseScreen();
          },
          routes: [
            GoRoute(
              path: 'course_add_form_screen',
              name: 'CourseAddFormScreen',
              builder: (context, state) {
                return CourseAddFormScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'community_screen',
          name: 'CommunityScreen',
          builder: (context, state) {
            return CommunityScreen();
          },
          routes: [
            GoRoute(
              path: 'community_detail_screen',
              name: 'CommunityDetailScreen',
              builder: (context, state) {
                return CommunityDetailScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'my_screen',
          name: 'MyScreen',
          builder: (context, state) {
            return MyScreen();
          },
        ),
      ],
    )
  ],
);
