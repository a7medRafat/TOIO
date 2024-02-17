import 'package:flutter/cupertino.dart';
import 'package:TOIO/config/colors.dart';
import 'package:TOIO/controller/app_cubit.dart';
import 'package:TOIO/generated/l10n.dart';
import 'package:TOIO/view/widgets/category/task_type_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          TaskTypeWidget(
            tasksLength: AppCubit.get(context).businessTasks.length,
            taskName: S.of(context).business,
            percent: AppCubit.get(context).businessTasks.length / 10,
            linearColor: AppColors().businessLinearColor,
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 20),
          TaskTypeWidget(
            tasksLength: AppCubit.get(context).personalTasks.length,
            taskName: S.of(context).personal,
            percent: AppCubit.get(context).personalTasks.length / 10,
            linearColor: AppColors().personalLinearColor,
          ),
        ],
      ),
    );
  }
}
