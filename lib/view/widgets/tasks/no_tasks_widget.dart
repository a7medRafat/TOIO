import 'package:flutter/material.dart';

import '../../../config/colors.dart';

class TOIOsksWidget extends StatelessWidget {
  const TOIOsksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .13),
        InkWell(
            onTap: () {},
            child: Icon(Icons.add, size: 50, color: AppColors().nBlack)),
        const SizedBox(height: 15),
        const Text(
          'You don\'t have any tasks yet',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        const Text(
          'tab to add new task',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}
