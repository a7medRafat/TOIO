import 'package:flutter/material.dart';
import 'package:TOIO/core/shared_preferances/cache_helper.dart';
import 'package:TOIO/core/utils/linear_percentage.dart';
import 'package:TOIO/generated/l10n.dart';
import '../../../config/colors.dart';
import '../../../controller/app_cubit.dart';

class TaskTypeWidget extends StatelessWidget {
  const TaskTypeWidget({
    super.key,
    required this.tasksLength,
    required this.taskName,
    required this.percent,
    required this.linearColor,
  });

  final int tasksLength;
  final String taskName;
  final double percent;
  final LinearGradient linearColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.14,
        decoration: BoxDecoration(
            boxShadow: [
              if (CacheHelper.getBoolean(key: 'isDark') == false)
                BoxShadow(
                  color: AppColors().favColor,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).cardColor),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('$tasksLength',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          color: AppCubit.get(context).isDark
                              ? Colors.white
                              : AppColors().nGray)),
                  const SizedBox(width: 5),
                  Text(S.of(context).task,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppCubit.get(context).isDark
                              ? Colors.white
                              : AppColors().nGray)),
                ],
              ),
              Text(taskName, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 18
              )),
              LinearPercantageWidget()
                  .add(percent: percent, linearColor: linearColor)
            ],
          ),
        ),
      ),
    );
  }
}
