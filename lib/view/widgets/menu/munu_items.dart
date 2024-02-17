import 'package:flutter/material.dart';
import 'package:TOIO/view/screens/setting_screen.dart';
import '../../../config/colors.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.icon, required this.menuName, required this.function});

  final IconData icon;
  final String menuName;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.1)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(icon, color: AppColors().favColor),
                const SizedBox(width: 10),
                Text(
                  menuName,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors().favColor,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
