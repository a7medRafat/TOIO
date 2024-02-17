import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:TOIO/generated/l10n.dart';
import '../../../controller/app_cubit.dart';

class ThemeWidget extends StatefulWidget {
  const ThemeWidget({super.key});

  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

bool isToogled = false;

class _ThemeWidgetState extends State<ThemeWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.blue.withOpacity(0.2),
                child:
                    const Icon(Icons.nightlight, size: 17, color: Colors.blue),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              Text(S.of(context).theme, style: Theme.of(context).textTheme.bodyLarge!),
              const Spacer(),
              FlutterSwitch(
                  toggleColor: Theme.of(context).scaffoldBackgroundColor,
                  width: 60,
                  height: 30.0,
                  valueFontSize: 10,
                  toggleSize: 25.0,
                  borderRadius: 20.0,
                  activeColor: AppCubit.get(context).isDark == true
                      ? Colors.lightBlue[700]!
                      : Colors.white54,
                  padding: 2,
                  inactiveColor: Colors.grey.withOpacity(0.2),
                  showOnOff: false,
                  value: AppCubit.get(context).isDark,
                  onToggle: (value) {
                    setState(() {
                      AppCubit.get(context).changeAppMood();
                    });
                  }),
            ],
          ),
        );
      },
    );
  }
}
