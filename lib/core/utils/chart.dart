import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:TOIO/config/colors.dart';
class AnimatedChart extends StatefulWidget {
  const AnimatedChart({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedChartState createState() => _AnimatedChartState();
}

class _AnimatedChartState extends State<AnimatedChart> {

  void startCreatingDemoData() async {
    for (int i = 0; i < 12; i++) {
      if (i == 0) continue;
      await Future.delayed((const Duration(milliseconds: 70))).then(
            (value) {
          Random random = Random();
          flspots.add(
            FlSpot(
              double.parse(i.toString()),
              random.nextDouble() * 6,
            ),
          );
          setState(() {
            setChartData();
          });
        },
      );
    }
  }

  LineChartData data = LineChartData();
   void setChartData() {
    data = LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return const FlLine(
              color: Colors.transparent,
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return const FlLine(
              color: Colors.redAccent,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: const FlTitlesData(
          show: false,

        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.transparent, width: 1),
        ),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
              spots: flspots,
              isCurved: true,
              gradient: AppColors().statesLinearColor,
              barWidth: 3,
              isStrokeCapRound: false,
              dotData: const FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: false,
                color: Colors.transparent,
              )
          ),
        ]);
  }

  List<FlSpot> flspots = [
    const FlSpot(0, 0),
  ];


  @override
  void initState() {
    setState(() {
      super.initState();
      startCreatingDemoData();
      setChartData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: MediaQuery.of(context).size.height * .15,
        width: double.infinity,
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            child: LineChart(data)));
  }
}
