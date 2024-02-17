import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/icons_broken.dart';
import '../../../controller/app_cubit.dart';

class DayTimePicker extends StatelessWidget {
  const DayTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppCubit.get(context).taskTimePicker != null
                  ? Colors.green.withOpacity(0.1)
                  : Colors.transparent),
          child: IconButton(
              onPressed: () {
                AppCubit.get(context).dayTimePicker(context);
              },
              icon: Icon(
                IconBroken.Time_Circle,
                size: 30,
                color: AppCubit.get(context).taskTimePicker == null
                    ? Theme.of(context).iconTheme.color
                    : Colors.green,
              )),
        );
      },
    );
  }
}
