import 'package:flutter/material.dart';
import 'package:TOIO/generated/l10n.dart';
import '../../../config/icons_broken.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.green.withOpacity(0.2),
            child: const Icon(Icons.help, size: 17, color: Colors.green),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Text(S.of(context).helpCenter,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!),
          const Spacer(),
          const Icon(
            IconBroken.Arrow___Right_2,
            size: 17,
          ),
        ],
      ),
    );
  }
}
