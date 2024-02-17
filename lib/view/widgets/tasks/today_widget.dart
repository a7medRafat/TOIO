import 'package:flutter/material.dart';
import 'package:TOIO/config/colors.dart';
import 'package:TOIO/generated/l10n.dart';
import 'package:intl/intl.dart';
import '../../../core/shared_preferances/cache_helper.dart';
class TodayWidget extends StatelessWidget {
  const TodayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String foramttdDay = DateFormat('dd').format(today);

    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
        boxShadow: [
          if (CacheHelper.getBoolean(key: 'isDark') == false)
            BoxShadow(
              color: AppColors().favColor,
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 1), // changes position of shadow
            ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text((foramttdDay), style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: AppColors().statesLinearColor),
              ),
            ),
            const SizedBox(height: 10),
            Text((S.of(context).today),
                style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
      ),
    );
  }
}
