import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../config/colors.dart';

class CiclePercentage extends StatelessWidget {

  const CiclePercentage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 50,
      animation: true,
      animationDuration: 1200,
      lineWidth: 3,
      backgroundWidth: 1,
      percent: 0.4,
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor:
      AppColors().favColor.withOpacity(0.4),
      progressColor: Colors.purple,
      center: CircleAvatar(
        radius: 35,
        backgroundImage:
        AssetImage('images/img.jpg'),
      ),
    );
  }
}
