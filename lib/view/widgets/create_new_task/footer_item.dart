import 'package:flutter/material.dart';

class FooterItem extends StatelessWidget {
  const FooterItem(
      {super.key,
      required this.funtion,
      required this.color,
      required this.icon,
      required this.backColor,
       });

  final Function() funtion;
  final Color? color;
  final Color? backColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backColor,
      ),
      child: IconButton(
          onPressed: funtion, icon: Icon(icon, size: 30, color: color)),
    );
  }
}
