import 'package:auto_route/auto_route.dart';
import 'package:ribal_alassaf_tht/config/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: NavigationBarRoute.page, initial: true, children: [
          AutoRoute(page: HouseConsumptionRoute.page),
          AutoRoute(page: BatteryConsumptionRoute.page),
          AutoRoute(page: SolarGenerationRoute.page),
        ]),
      ];
}
