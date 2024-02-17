import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TOIO/config/colors.dart';
import 'package:TOIO/generated/l10n.dart';
import '../../../config/icons_broken.dart';
import '../../../controller/app_cubit.dart';
import '../../../core/utils/dot_loading.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  AppCubit.get(context).datePicker(context);
                },
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Icon(IconBroken.Calendar,
                      size: 20, color: Theme.of(context).iconTheme.color),
                ),
                label: Text(
                  AppCubit.get(context).uiDate == null
                      ? S.of(context).today
                      : AppCubit.get(context).uiDate.toString(),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: AppCubit.get(context).selectedDate == null
                            ? Theme.of(context).iconTheme.color!
                            : Colors.green,
                        width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
              const SizedBox(width: 10),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.3, color: AppColors().nGray),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: DotLoading(),
                  ))
            ],
          ),
        );
      },
    );
  }
}
