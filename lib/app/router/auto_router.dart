import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../presentation/pages/signin/signin.dart';

part 'auto_router.gr.dart';

@AutoRouterConfig()
@LazySingleton()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.cupertino(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignInRoute.page,
          path: '/',
        ),
      ];
}
