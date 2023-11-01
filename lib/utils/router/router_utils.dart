enum AppRoutes {
  initial,
  signIn,
  home,
}

extension Routes on AppRoutes {
  String get routeName {
    switch (this) {
      case AppRoutes.initial:
        return 'initial';
      case AppRoutes.signIn:
        return 'signIn';
      case AppRoutes.home:
        return 'home';

      default:
        return 'initial';
    }
  }

  String get routePath {
    switch (this) {
      case AppRoutes.initial:
        return '/';
      case AppRoutes.signIn:
        return '/signIn';
      case AppRoutes.home:
        return '/home';

      default:
        return '/';
    }
  }
}
