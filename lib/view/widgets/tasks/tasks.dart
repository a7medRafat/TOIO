import 'package:flutter/cupertino.dart';
import '../../../controller/app_cubit.dart';
import 'task_item.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) =>
            BuildTaskItem(
              context: context,
              model: AppCubit
                  .get(context)
                  .allTasks[index],

            ),
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemCount: AppCubit
            .get(context)
            .allTasks
            .length);
  }
}
