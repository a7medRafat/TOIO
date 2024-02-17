import 'package:flutter/material.dart';
import 'package:TOIO/view/screens/drawer_screen.dart';
import '../../../controller/app_cubit.dart';
import '../../../core/shared_preferances/cache_helper.dart';
import '../../../core/utils/navigation.dart';

class AddTaskBtn extends StatelessWidget {
  AddTaskBtn({super.key, required this.formKey});

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
            cubit
                .insetToDateBase(
                    title: cubit.myController.text,
                    fav: cubit.isFav,
                    time: cubit.taskTimePicker!.format(context),
                    date: cubit.selectedDate.toString().trim(),
                    completeDate: cubit.completeDateTime.toString(),
                    type: CacheHelper.getData(key: 'taskType'))
                .then((value) {
              CacheHelper.getData(key: 'taskType') == 'Personal'
                  ? cubit.getPersonalTasks()
                  : cubit.getBusinessTasks();
              Navigation().navigateTo(context, DrawerScreen());
              cubit.taskTimePicker = null;
              cubit.taskFav = false;
              cubit.selectedDate = null;
            });
          }
        },
        child: Icon(Icons.add, color: Theme.of(context).iconTheme.color));
  }
}
