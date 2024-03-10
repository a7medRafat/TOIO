import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableActions extends StatelessWidget {
  const SlidableActions({
    super.key,
    required this.function,
    required this.icon,
    required this.backColor,
  });

  final function;
  final IconData icon;
  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(100),
      onPressed: function,
      backgroundColor: backColor,
      foregroundColor: Theme.of(context).iconTheme.color,
      spacing: 0,
      icon: icon,
    );
  }
}
