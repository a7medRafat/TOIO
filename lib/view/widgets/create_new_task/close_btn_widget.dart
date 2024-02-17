import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../controller/app_cubit.dart';

class CloseBtnWidget extends StatelessWidget {
  const CloseBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              AppCubit.get(context).uiDate = null;
              AppCubit.get(context).taskTimePicker = null;
              AppCubit.get(context).selectedDate = null;
              Navigator.pop(context);
            },
            icon: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Theme.of(context).iconTheme.color!)),
              child: Icon(
                Icons.clear,
                color: Theme.of(context).iconTheme.color,
                size: 20,
              ),
            )),
      ],
    );
  }
}
