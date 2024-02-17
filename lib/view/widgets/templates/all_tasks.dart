import 'package:flutter/material.dart';
import 'package:TOIO/generated/l10n.dart';
import 'package:TOIO/view/widgets/templates/templates_task_item.dart';
import '../../../controller/app_cubit.dart';
import '../create_new_task/close_btn_widget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(S.of(context).allTasks,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              const CloseBtnWidget(),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.02),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => TemplatesTaskItem(
                      map: AppCubit.get(context).allTasks[index],
                      backColor: Theme.of(context).cardColor,
                    ),
                separatorBuilder: (context, index) => const SizedBox(height: 0),
                itemCount: AppCubit.get(context).allTasks.length),
          ),
        ],
      ),
    );
  }
}
