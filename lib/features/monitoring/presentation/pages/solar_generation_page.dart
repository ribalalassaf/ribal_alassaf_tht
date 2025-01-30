import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ribal_alassaf_tht/features/monitoring/presentation/blocs/monitoring_cubit/monitoring_cubit.dart';
import 'package:ribal_alassaf_tht/features/monitoring/presentation/components/monitoring_page_content.dart';

@RoutePage()
class SolarGenerationPage extends StatelessWidget {
  final MonitoringCubit cubit;

  const SolarGenerationPage({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return MonitoringPageContent(
        cubit: cubit, title: "Your panel's generation", fetchFunction: cubit.getSolarGenerationData);
  }
}
