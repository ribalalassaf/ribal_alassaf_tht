// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:ribal_alassaf_tht/features/monitoring/presentation/blocs/monitoring_cubit/monitoring_cubit.dart'
    as _i7;
import 'package:ribal_alassaf_tht/features/monitoring/presentation/pages/battery_consumption_page.dart'
    as _i1;
import 'package:ribal_alassaf_tht/features/monitoring/presentation/pages/house_consumption_page.dart'
    as _i2;
import 'package:ribal_alassaf_tht/features/monitoring/presentation/pages/navigation_bar_page.dart'
    as _i3;
import 'package:ribal_alassaf_tht/features/monitoring/presentation/pages/solar_generation_page.dart'
    as _i4;

/// generated route for
/// [_i1.BatteryConsumptionPage]
class BatteryConsumptionRoute
    extends _i5.PageRouteInfo<BatteryConsumptionRouteArgs> {
  BatteryConsumptionRoute({
    _i6.Key? key,
    required _i7.MonitoringCubit cubit,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          BatteryConsumptionRoute.name,
          args: BatteryConsumptionRouteArgs(
            key: key,
            cubit: cubit,
          ),
          initialChildren: children,
        );

  static const String name = 'BatteryConsumptionRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BatteryConsumptionRouteArgs>();
      return _i1.BatteryConsumptionPage(
        key: args.key,
        cubit: args.cubit,
      );
    },
  );
}

class BatteryConsumptionRouteArgs {
  const BatteryConsumptionRouteArgs({
    this.key,
    required this.cubit,
  });

  final _i6.Key? key;

  final _i7.MonitoringCubit cubit;

  @override
  String toString() {
    return 'BatteryConsumptionRouteArgs{key: $key, cubit: $cubit}';
  }
}

/// generated route for
/// [_i2.HouseConsumptionPage]
class HouseConsumptionRoute
    extends _i5.PageRouteInfo<HouseConsumptionRouteArgs> {
  HouseConsumptionRoute({
    _i6.Key? key,
    required _i7.MonitoringCubit cubit,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          HouseConsumptionRoute.name,
          args: HouseConsumptionRouteArgs(
            key: key,
            cubit: cubit,
          ),
          initialChildren: children,
        );

  static const String name = 'HouseConsumptionRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HouseConsumptionRouteArgs>();
      return _i2.HouseConsumptionPage(
        key: args.key,
        cubit: args.cubit,
      );
    },
  );
}

class HouseConsumptionRouteArgs {
  const HouseConsumptionRouteArgs({
    this.key,
    required this.cubit,
  });

  final _i6.Key? key;

  final _i7.MonitoringCubit cubit;

  @override
  String toString() {
    return 'HouseConsumptionRouteArgs{key: $key, cubit: $cubit}';
  }
}

/// generated route for
/// [_i3.NavigationBarPage]
class NavigationBarRoute extends _i5.PageRouteInfo<void> {
  const NavigationBarRoute({List<_i5.PageRouteInfo>? children})
      : super(
          NavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationBarRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.NavigationBarPage();
    },
  );
}

/// generated route for
/// [_i4.SolarGenerationPage]
class SolarGenerationRoute extends _i5.PageRouteInfo<SolarGenerationRouteArgs> {
  SolarGenerationRoute({
    _i6.Key? key,
    required _i7.MonitoringCubit cubit,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          SolarGenerationRoute.name,
          args: SolarGenerationRouteArgs(
            key: key,
            cubit: cubit,
          ),
          initialChildren: children,
        );

  static const String name = 'SolarGenerationRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SolarGenerationRouteArgs>();
      return _i4.SolarGenerationPage(
        key: args.key,
        cubit: args.cubit,
      );
    },
  );
}

class SolarGenerationRouteArgs {
  const SolarGenerationRouteArgs({
    this.key,
    required this.cubit,
  });

  final _i6.Key? key;

  final _i7.MonitoringCubit cubit;

  @override
  String toString() {
    return 'SolarGenerationRouteArgs{key: $key, cubit: $cubit}';
  }
}
