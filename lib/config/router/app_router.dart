import 'package:go_router/go_router.dart';
import 'package:promolider_app/features/auth/presentation/screens/screens.dart';
import 'package:promolider_app/features/home/presentation/screens/screens.dart';
import 'package:promolider_app/utils/router/custom_transition_page.dart';
import 'package:promolider_app/utils/router/router_utils.dart';

class AppRouter {
  static final appRouter = GoRouter(
    initialLocation: AppRoutes.initial.routePath,
    routes: [
      GoRoute(
        path: AppRoutes.initial.routePath,
        name: AppRoutes.initial.name,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const InitialScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.signIn.routePath,
        name: AppRoutes.signIn.name,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const SignInScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.home.routePath,
        name: AppRoutes.home.name,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const HomeScreen(),
        ),
      ),
    ],
  );
}
