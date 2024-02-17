import 'package:animated_floating_buttons/widgets/animated_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TOIO/generated/l10n.dart';
import '../../controller/app_cubit.dart';
import '../widgets/category/category_widget.dart';
import '../widgets/category/category_text_widget.dart';
import '../widgets/floating_button/animated _floating_btn.dart';
import '../widgets/main_menue.dart';
import '../widgets/states_widget.dart';
import '../widgets/tasks/today_tasks.dart';
import '../widgets/tasks/today_widget.dart';
import '../widgets/tasks/todays_task_widget.dart';

// ignore: must_be_immutable
class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController myTitleController = TextEditingController();

  TextEditingController myTimeController = TextEditingController();

  TextEditingController myDateController = TextEditingController();
  final GlobalKey<AnimatedFloatingActionButtonState> key1 =
      GlobalKey<AnimatedFloatingActionButtonState>();
  final GlobalKey<AnimatedFloatingActionButtonState> key2 =
      GlobalKey<AnimatedFloatingActionButtonState>();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      buildWhen: (previuos, current) => current is GetAllTasksSuccessState,
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: AnimatedFloatingBtn(key1: key1, key2: key2),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainMenu(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TodayWidget(),
                      StatesWidget(),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  const CategotyTextWidget(),
                  const CategoryWidget(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  if (cubit.todaysTasks.isNotEmpty)
                    WidgetName(name: S.of(context).todayTask),
                  TaskList(
                      listName: cubit.todaysTasks,
                      listLength: cubit.todaysTasks.length),
                  if (cubit.tomorrowsTasks.isNotEmpty)
                    WidgetName(name: S.of(context).tomorrowTask),
                  TaskList(
                      listName: cubit.tomorrowsTasks,
                      listLength: cubit.tomorrowsTasks.length),
                  if (cubit.thisMonthTasks.isNotEmpty)
                    WidgetName(name: S.of(context).thisMonth),
                  TaskList(
                      listName: cubit.thisMonthTasks,
                      listLength: cubit.thisMonthTasks.length),
                ],
              ),
            ),
          ),
          // cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
