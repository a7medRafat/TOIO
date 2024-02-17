import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TOIO/core/utils/navigation.dart';
import 'package:TOIO/generated/l10n.dart';
import 'package:TOIO/view/screens/setting_screen.dart';
import 'package:TOIO/view/screens/templates_screen.dart';
import 'package:TOIO/view/widgets/menu/munu_items.dart';
import '../../config/icons_broken.dart';
import '../../controller/app_cubit.dart';
import '../../core/utils/chart.dart';
import '../widgets/menu/back_widget.dart';
import '../widgets/menu/footer.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const ArrowBack(),
              MenuItem(
                icon: IconBroken.Document,
                menuName: S.of(context).templetas,
                function: () {
                  Navigation().navigateTo(context, const TemplatesScreen());
                  AppCubit.get(context).getAllTasks();
                },
              ),
              MenuItem(
                icon: IconBroken.Setting,
                menuName: S.of(context).settings,
                function: () =>Navigation().navigateTo(context, const SettingScreen()),
              ),
              MenuItem(
                icon: IconBroken.Work,
                menuName: S.of(context).about,
                function: () {},
              ),
              const AnimatedChart(),
              SizedBox(height: MediaQuery.of(context).size.height * .05),
              const MenuFooter(),
            ],
          ),
        );
      },
    );
  }
}
