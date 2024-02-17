import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:TOIO/controller/app_cubit.dart';
import 'package:TOIO/view/screens/layout.dart';
import 'package:TOIO/view/screens/menu_screen.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});

  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ZoomDrawer(
          controller: zoomDrawerController,
          menuScreen: const MenuScreen(),
          mainScreen: const Layout(),
          borderRadius: 24.0,
          showShadow: true,
          angle: 0,
          isRtl: AppCubit.get(context).arabicLang,
          drawerShadowsBackgroundColor: Colors.grey,
          slideWidth: MediaQuery.of(context).size.width * .75,
          openCurve: Curves.fastOutSlowIn,
          closeCurve: Curves.bounceIn,
          style: DrawerStyle.defaultStyle,
        );
      },
    );
  }
}
