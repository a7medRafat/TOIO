import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TOIO/controller/app_cubit.dart';
import 'dart:math' as math;
import '../../config/colors.dart';
import '../widgets/splash/splash_btn.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff368e8d),
      body: BlocListener<AppCubit, AppState>(
        listener: (context, state) {},
        child: Stack(
          children: <Widget>[
            Positioned(
              top: size.height / 5.2,
              right: size.width / 2.2,
              child: Transform.rotate(
                angle: math.pi / 4,
                child: Container(
                  height: size.height * 0.6,
                  width: size.height * 0.6,
                  decoration: BoxDecoration(
                    color: AppColors().darkModeColor,
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'TOIO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('handle your daily tasks',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white70)),
                ],
              ),
            ),
            const Positioned(bottom: -90, right: -70, child: SplashBtn()),
          ],
        ),
      ),
    );
  }
}
