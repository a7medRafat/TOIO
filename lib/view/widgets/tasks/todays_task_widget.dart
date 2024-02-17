import 'package:flutter/material.dart';

class WidgetName extends StatelessWidget {

  const WidgetName({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Text(name,
          style:
          Theme.of(context).textTheme.bodyMedium!),
    );
  }
}
