import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TOIO/generated/l10n.dart';
import '../../controller/app_cubit.dart';
import '../widgets/create_new_task/close_btn_widget.dart';
import '../widgets/settings/help_widget.dart';
import '../widgets/settings/language_widget.dart';
import '../widgets/settings/theme_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(S.of(context).settings,
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    const CloseBtnWidget(),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.2),
                const LanguageWidget(),
                const ThemeWidget(),
                const HelpWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
