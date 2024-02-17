import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TOIO/core/shared_preferances/cache_helper.dart';
import '../../config/icons_broken.dart';
import '../../controller/app_cubit.dart';
import '../widgets/create_new_task/add_task_btn.dart';
import '../widgets/create_new_task/close_btn_widget.dart';
import '../widgets/create_new_task/date_picker_widget.dart';
import '../widgets/create_new_task/footer_item.dart';
import '../widgets/create_new_task/task_input_widget.dart';
import '../widgets/create_new_task/time_picker.dart';

// ignore: must_be_immutable
class CreateNewTask extends StatefulWidget {
  CreateNewTask({super.key});

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is TaskInsertedSuccessState) {
          cubit.myController.text = '';
          cubit.uiDate = null;
          cubit.taskTimePicker = null;
        }
      },
      builder: (context, state) {
        return Scaffold(
            extendBodyBehindAppBar: true,
            body: Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const CloseBtnWidget(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .19),
                      const TaskInputWidget(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),
                      const DatePickerWidget(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .13),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DayTimePicker(),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          FooterItem(
                              funtion: () {
                                AppCubit.get(context).favTabbed();
                              },
                              color: cubit.taskFav == false
                                  ? Theme.of(context).iconTheme.color
                                  : Colors.red,
                              icon: cubit.taskFav == false
                                  ? IconBroken.Heart
                                  : CupertinoIcons.heart_fill,
                              backColor: cubit.taskFav == true
                                  ? Colors.red.withOpacity(0.1)
                                  : Colors.transparent),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          FooterItem(
                              funtion: () {
                                cubit.changeAppMood();
                              },
                              color:
                                  CacheHelper.getBoolean(key: 'isDark') == true
                                      ? Colors.blue
                                      : Theme.of(context).iconTheme.color,
                              icon: cubit.isDark
                                  ? Icons.nightlight_outlined
                                  : IconBroken.Star,
                              backColor:
                                  CacheHelper.getBoolean(key: 'isDark') == true
                                      ? Colors.blueGrey.withOpacity(0.1)
                                      : Colors.transparent),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: AddTaskBtn(
              formKey: formKey,
            ));
      },
    );
  }
}
