import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:TOIO/config/colors.dart';

import '../../../config/icons_broken.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.07),
      child: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.close();
          },
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15.5,
            child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 15,
                child: Icon(IconBroken.Arrow___Left_2,
                    size: 16, color: AppColors().favColor)),
          )),
    );
  }
}
