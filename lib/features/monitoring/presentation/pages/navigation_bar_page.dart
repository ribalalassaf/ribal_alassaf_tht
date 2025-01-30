import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ribal_alassaf_tht/config/injectable.dart';
import 'package:ribal_alassaf_tht/config/router/router.gr.dart';
import 'package:ribal_alassaf_tht/features/monitoring/presentation/blocs/monitoring_cubit/monitoring_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  late MonitoringCubit houseConsumptionCubit;
  late MonitoringCubit batteryConsumptionCubit;
  late MonitoringCubit solarGenerationCubit;
  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    houseConsumptionCubit = getIt<MonitoringCubit>()..getHouseConsumptionData(initialDate);
    batteryConsumptionCubit = getIt<MonitoringCubit>()..getBatteryConsumptionData(initialDate);
    solarGenerationCubit = getIt<MonitoringCubit>()..getSolarGenerationData(initialDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => houseConsumptionCubit,
        ),
        BlocProvider(
          create: (context) => batteryConsumptionCubit,
        ),
        BlocProvider(
          create: (context) => solarGenerationCubit,
        ),
      ],
      child: AutoTabsRouter(
        routes: [
          HouseConsumptionRoute(cubit: houseConsumptionCubit),
          BatteryConsumptionRoute(cubit: batteryConsumptionCubit),
          SolarGenerationRoute(cubit: solarGenerationCubit),
        ],
        homeIndex: 0,
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            bottomNavigationBar: _BottomNavigationBar(tabsRouter: tabsRouter),
            body: child,
          );
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    required this.tabsRouter,
  });

  final TabsRouter tabsRouter;
  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: navigationBarItem(label: "House", index: 0, icon: Icons.house_outlined)),
          Expanded(child: navigationBarItem(label: "Battery", index: 1, icon: Icons.battery_3_bar_outlined)),
          Expanded(child: navigationBarItem(label: "Solar", index: 2, icon: Icons.solar_power_outlined)),
        ],
      ),
    );
  }

  Widget navigationBarItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        AutoTabsRouter.of(context).setActiveIndex(index);
      },
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          icon,
          size: 25,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
