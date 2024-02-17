import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:TOIO/config/colors.dart';
import 'package:TOIO/core/utils/navigation.dart';
import 'package:TOIO/view/screens/drawer_screen.dart';

import '../../../config/icons_broken.dart';

class SplashBtn extends StatelessWidget {
  const SplashBtn({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigation().navigateTo(context, DrawerScreen()),
      child: Stack(
        children: [
          Transform.rotate(
            angle: math.pi / 4,
            child: Container(
              height: size.width * 0.7,
              width: size.width * 0.68,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black26),
                borderRadius: BorderRadius.circular(87.0),
              ),
              child: Container(
                height: size.width * 0.65,
                width: size.width * 0.62,
                decoration: BoxDecoration(
                  color: AppColors().splashBtnColor,
                  borderRadius: BorderRadius.circular(79.0),
                ),
                child: Transform.rotate(
                  angle: -math.pi / 4,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(IconBroken.Arrow___Right_2,color: Colors.white70,),
                      Icon(IconBroken.Arrow___Right_2,color: Colors.white70,),
                      Icon(IconBroken.Arrow___Right_2,color: Colors.white70,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
