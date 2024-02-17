import 'package:flutter/material.dart';
import 'package:TOIO/generated/l10n.dart';

import '../../../controller/app_cubit.dart';

class TaskInputWidget extends StatelessWidget {
  const TaskInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleMedium!,
      decoration: InputDecoration(
          hintText: S.of(context).enterNewTask,
          hintStyle:Theme.of(context).textTheme.titleMedium,
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
      controller: AppCubit.get(context).myController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'task field required';
        }
        return null;
      },
    );
  }
}
