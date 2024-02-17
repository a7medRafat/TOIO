import 'package:animated_floating_buttons/widgets/animated_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:TOIO/core/utils/navigation.dart';
import 'package:TOIO/generated/l10n.dart';
import 'package:TOIO/view/screens/new_task_screen.dart';
import '../../../config/colors.dart';
import '../../../config/icons_broken.dart';
import '../../../core/shared_preferances/cache_helper.dart';
import 'floating_btn.dart';

class AnimatedFloatingBtn extends StatelessWidget {
  const AnimatedFloatingBtn(
      {super.key, required this.key1, required this.key2});

  final GlobalKey<AnimatedFloatingActionButtonState> key1;
  final GlobalKey<AnimatedFloatingActionButtonState> key2;

  @override
  Widget build(BuildContext context) {
    return AnimatedFloatingActionButton(
      fabButtons: <Widget>[
        FloatingButtons(
          btnKey: key1,
          icon: IconBroken.Profile,
          lable: S.of(context).personalType,
          backColor: AppColors().personalColor,
          tag: '1',
          function: () {
            CacheHelper.saveData(key: 'Dot', value: 'Personal');
            Navigation().navigateTo(context, CreateNewTask());
            CacheHelper.saveData(key: 'taskType', value: 'Personal');
          },
        ),
        FloatingButtons(
          btnKey: key2,
          icon: IconBroken.Work,
          lable: S.of(context).businessType,
          backColor: AppColors().bussinesslColor,
          tag: '2',
          function: () {
            CacheHelper.saveData(key: 'Dot', value: 'Business');
            Navigation().navigateTo(context, CreateNewTask());
            CacheHelper.saveData(key: 'taskType', value: 'Business');
          },
        ),
      ],
      colorStartAnimation: CacheHelper.getBoolean(key: 'isDark') == true
          ? Colors.black
          : Colors.white,
      colorEndAnimation: CacheHelper.getBoolean(key: 'isDark') == true
          ? Colors.black
          : Colors.white,
      animatedIconData: AnimatedIcons.add_event,
    );
  }
}
