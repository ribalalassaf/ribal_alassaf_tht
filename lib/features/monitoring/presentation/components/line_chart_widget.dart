import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ribal_alassaf_tht/features/monitoring/domain/models/monitoring_data_model.dart';
import 'package:ribal_alassaf_tht/utils/enums.dart';

class LineChartWidget extends StatelessWidget {
  final List<MonitoringDataModel> points;
  final MetricUnit unit;
  const LineChartWidget({super.key, required this.points, required this.unit});

  Border verticalBordersOnly() {
    return const Border.symmetric(
        vertical: BorderSide(color: Colors.black), horizontal: BorderSide(color: Colors.black));
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    String text;
    switch (value.toInt()) {
      case 24:
        text = '02:00';
        break;
      case 48:
        text = '04:00';
        break;
      case 72:
        text = '06:00';
        break;
      case 96:
        text = '08:00';
        break;
      case 120:
        text = '10:00';
        break;
      case 144:
        text = '12:00';
        break;
      case 168:
        text = '14:00';
        break;
      case 192:
        text = '16:00';
        break;
      case 216:
        text = '18:00';
        break;
      case 240:
        text = '20:00';
        break;
      case 264:
        text = '22:00';
        break;
      case 287:
        text = '23:55';
        break;

      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: AxisSide.bottom,
      child: RotatedBox(
          quarterTurns: 1,
          child: Text(
            text,
            style: const TextStyle(fontSize: 12),
          )),
    );
  }

  FlTitlesData titlesData() => FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: unit == MetricUnit.Watt ? 2000 : 2,
            reservedSize: 55,
            getTitlesWidget: (double value, TitleMeta meta) {
              return Center(
                child: Text(
                  value.toInt().toString(),
                ),
              );
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 24,
            reservedSize: 50,
            getTitlesWidget: (double value, TitleMeta meta) {
              return bottomTitleWidgets(value, meta, 30);
            },
          ),
        ),
        topTitles: const AxisTitles(),
        rightTitles: const AxisTitles(),
      );

  LineChartBarData line({Color? color, List<FlSpot>? spots}) => LineChartBarData(
        spots: spots!,
        dotData: const FlDotData(show: false),
        isCurved: true,
        color: color,
        barWidth: 0.5,
      );

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: titlesData(),
        gridData: const FlGridData(
          drawVerticalLine: false,
          drawHorizontalLine: false,
        ),
        borderData: FlBorderData(show: true, border: verticalBordersOnly()),
        lineBarsData: [
          line(color: Colors.black, spots: [
            for (int i = 0; i < points.length; i++)
              if (points.elementAt(i).time!.minute == 0)
                FlSpot(i.toDouble(),
                    unit == MetricUnit.Watt ? points.elementAt(i).value! : points.elementAt(i).value! / 1000)
          ]),
        ],
        lineTouchData: const LineTouchData(touchTooltipData: LineTouchTooltipData(tooltipBgColor: Colors.transparent)),
        minX: 0,
        maxX: points.length.toDouble() - 1,
        minY: 0,
        maxY: unit == MetricUnit.Watt ? 10000 : 10,
      ),
    );
  }
}
