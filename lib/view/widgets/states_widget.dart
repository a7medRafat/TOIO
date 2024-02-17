import 'package:TOIO/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:TOIO/config/colors.dart';
import '../../config/icons_broken.dart';

class StatesWidget extends StatelessWidget {
  const StatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: AppColors().statesLinearColor),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(IconBroken.Chart, color: Colors.white, size: 50),
              Text((S.of(context).stats),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
