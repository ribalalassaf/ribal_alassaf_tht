import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ribal_alassaf_tht/config/injectable.dart';
import 'package:ribal_alassaf_tht/features/monitoring/presentation/blocs/monitoring_cubit/monitoring_cubit.dart';
import 'package:ribal_alassaf_tht/features/monitoring/presentation/components/line_chart_widget.dart';
import 'package:ribal_alassaf_tht/utils/enums.dart';
import 'package:ribal_alassaf_tht/utils/general_widgets.dart';
import 'package:ribal_alassaf_tht/utils/styles.dart';

class MonitoringPageContent extends StatefulWidget {
  final MonitoringCubit cubit;
  final String title;
  final Function(DateTime) fetchFunction;
  const MonitoringPageContent({super.key, required this.cubit, required this.title, required this.fetchFunction});

  @override
  State<MonitoringPageContent> createState() => _MonitoringPageContentState();
}

class _MonitoringPageContentState extends State<MonitoringPageContent> {
  DateTime chosenDate = DateTime.now();
  MetricUnit chosenUnit = MetricUnit.Watt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        forceMaterialTransparency: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          widget.fetchFunction(chosenDate);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            child: Column(
              children: [
                CustomDropDown<MetricUnit>(
                    values: MetricUnit.values,
                    initialValue: MetricUnit.Watt,
                    onChange: (value) {
                      setState(() {
                        chosenUnit = value!;
                      });
                    }),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    DateTime temp = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now().subtract(const Duration(days: 365 * 5)),
                            lastDate: DateTime.now()) ??
                        chosenDate;

                    if (temp != chosenDate) {
                      widget.fetchFunction(chosenDate);
                      chosenDate = temp;
                      setState(() {});
                    }
                  },
                  child: Container(
                    height: 50,
                    alignment: AlignmentDirectional.centerStart,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: blackRadiusDecoration,
                    child: Text(
                      DateFormat("yyyy-MM-dd").format(chosenDate),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    await getIt<CacheStore>().clean();
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cache Cleared")));
                  },
                  child: Container(
                    height: 50,
                    alignment: AlignmentDirectional.centerStart,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: blackRadiusDecoration,
                    child: const Text(
                      "Clear cache",
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 450,
                  child: BlocConsumer<MonitoringCubit, MonitoringState>(
                    bloc: widget.cubit,
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        failure: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => const SizedBox(),
                        inProgress: () => const Center(child: CircularProgressIndicator()),
                        success: (points) => LineChartWidget(points: points, unit: chosenUnit),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
