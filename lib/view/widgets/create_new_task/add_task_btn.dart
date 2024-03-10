import 'package:TOIO/core/snackbar/mysnackbar.dart';
import 'package:flutter/material.dart';
import '../../../controller/app_cubit.dart';
import '../../../core/shared_preferances/cache_helper.dart';

class AddTaskBtn extends StatelessWidget {
  const AddTaskBtn({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return FloatingActionButton(
        backgroundColor: CacheHelper.getBoolean(key: 'isDark') == true
            ? Colors.black54
            : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          if (formKey.currentState!.validate() &&
              cubit.taskTimePicker != null &&
              cubit.selectedDate != null) {
            cubit.getCompleteDate();
            if (cubit.businessTasks.length == 10 ||
                cubit.personalTasks.length == 10) {
              StyledToast.show(
                  context: context, text: 'tasks shoul\'d be more than 10');
            } else {
              cubit.insetToDateBase(
                  title: cubit.myController.text,
                  fav: cubit.isFav,
                  time: cubit.taskTimePicker!.format(context),
                  date: cubit.selectedDate.toString().trim(),
                  completeDate: cubit.completeDateTime.toString(),
                  type: CacheHelper.getData(key: 'taskType'),
                  context: context);
            }
          }
        },
        child: Icon(Icons.add, color: Theme.of(context).iconTheme.color));
  }
}
