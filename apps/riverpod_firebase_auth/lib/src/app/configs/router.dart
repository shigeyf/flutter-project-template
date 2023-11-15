import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../constants.dart';
import './go_router_refresh_stream.dart';
import './router_path_string.dart';
import '../pages/welcome_page.dart';
import '../pages/signin_page.dart';
import '../pages/home_page.dart';
import '../pages/account_page.dart';
import '../widgets/scaffold_with_stateful_navigation_bar.dart';
import '../../features/authentication/providers.dart';
import '../../features/welcome/providers.dart';

/// Provides private navigator keys for GoRouter
final _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: navigationLabelRoot);
final _homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: navigationLabelHome);
final _accountNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: navigationLabelAccount);

final signinPath = fnRootPath(pathSignin);
final welcomPath = fnRootPath(pathWelcome);
final homePath = fnRootPath(pathHome);
final accountPath = fnRootPath(pathAccount);

/// Defines GoRouter configurations for the app
final goRouterCofigProvider = AutoDisposeProvider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final welcomeRepository = ref.watch(welcomeRepositoryProvider);

  return GoRouter(
    initialLocation: signinPath,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    // Redirect logic
    redirect: (context, state) {
      final didCompleteWelcome = welcomeRepository.isWelcomeCompleted();
      final path = state.uri.path;
      if (!didCompleteWelcome) {
        // Always check state.subloc before returning a non-null route
        // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart#L78
        if (path != welcomPath) {
          return welcomPath;
        }
      }
      final isLoggedIn = authRepository.currentUser != null;
      if (isLoggedIn) {
        if (path.startsWith(signinPath)) {
          return homePath;
        }
      } else {
        if (path.startsWith(homePath) || path.startsWith(accountPath)) {
          return signinPath;
        }
      }
      return null;
    },
    // Refresh logic
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    // Routing logic
    routes: [
      GoRoute(
        path: welcomPath,
        name: AppRoute.welcome.name,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: WelcomePage()),
      ),
      GoRoute(
        path: signinPath,
        name: AppRoute.signin.name,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SigninPage()),
      ),
      // Stateful navigation based on:
      // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithStatefulNavigationBar(
              navigationShell: navigationShell);
        },
        branches: [
          // Home branch
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: <RouteBase>[
              // ROUTE-START: /home
              GoRoute(
                path: homePath,
                name: AppRoute.home.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomePage()),
                routes: const <RouteBase>[],
              ),
              // ROUTE-END: /home
            ],
          ),
          // Account branch
          StatefulShellBranch(
            navigatorKey: _accountNavigatorKey,
            routes: [
              // ROUTE-START: /account
              GoRoute(
                path: accountPath,
                name: AppRoute.account.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: AccountPage()),
                routes: const <RouteBase>[],
              ),
              // ROUTE-END: /account
            ],
          ),
        ],
      ),
    ],
  );
});
