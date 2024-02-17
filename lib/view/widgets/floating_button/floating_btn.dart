import 'package:flutter/material.dart';


class FloatingButtons extends StatelessWidget {
  const FloatingButtons(
      {super.key,
      required this.btnKey,
      required this.icon,
      required this.lable, required this.backColor, required this.tag, required this.function});

  final Key btnKey;
  final IconData icon;
  final String lable;
  final String tag;
  final Color backColor;
  final function;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: tag,
      key: key,
      splashColor: Colors.transparent,
      backgroundColor: backColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed:  function,
      icon: Icon(icon,color: Theme.of(context).iconTheme.color),
      label: Text(
        lable,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

