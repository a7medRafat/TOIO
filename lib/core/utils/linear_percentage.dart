import 'package:flutter/material.dart';
import 'package:TOIO/config/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearPercantageWidget {
  Widget add({required double percent , required LinearGradient linearColor}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: LinearPercentIndicator(
          padding: const EdgeInsets.only(right: 10),
          lineHeight: 5,
          animation: true,
          percent: percent,
          isRTL: false,
          linearGradient: linearColor,
          animationDuration: 800,
          barRadius:const Radius.circular(5) ,
          backgroundColor: AppColors().nGray.withOpacity(0.7),
        ),
  );
}
