import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../config/colors.dart';
import '../../../config/icons_broken.dart';
import '../../../controller/app_cubit.dart';

class FavTaskWidget extends StatelessWidget {
  const FavTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppCubit.get(context).taskFav == true
              ? AppColors().favouriteColor.withOpacity(0.1)
              : Colors.transparent),
      child: IconButton(
          onPressed: () {
            AppCubit.get(context).changeFavTask();
          },
          icon: Icon(
            IconBroken.Heart,
            size: 30,
            color: AppCubit.get(context).taskFav == false
                ? Theme.of(context).iconTheme.color
                : AppColors().favouriteColor,
          )),
    );
  }
}
