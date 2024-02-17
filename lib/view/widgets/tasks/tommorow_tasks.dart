import 'package:flutter/cupertino.dart';
import 'package:TOIO/view/widgets/tasks/task_item.dart';
import '../../../controller/app_cubit.dart';

class TomorrowsTasks extends StatelessWidget {

  const TomorrowsTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => BuildTaskItem(
          context: context,
          model: AppCubit.get(context).tomorrowsTasks[index],
        ),
        separatorBuilder: (context, index) =>
        const SizedBox(height: 5),
        itemCount: AppCubit.get(context).tomorrowsTasks.length);
  }
}
