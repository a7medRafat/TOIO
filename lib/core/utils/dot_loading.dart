import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:TOIO/config/colors.dart';
import 'package:TOIO/controller/app_cubit.dart';
import 'package:TOIO/core/shared_preferances/cache_helper.dart';

class DotLoading extends StatelessWidget {
  const DotLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: 35,
          child: LoadingIndicator(
              indicatorType: Indicator.ballScale,
              colors: [CacheHelper.getData(key: 'Dot') == 'Personal'? AppColors().personalColor : AppColors().bussinesslColor],
              strokeWidth: 3,
              backgroundColor: Colors.transparent,
              pathBackgroundColor: Colors.black),
        );
      },
    );
  }
}
