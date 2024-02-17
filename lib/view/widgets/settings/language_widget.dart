import 'package:flutter/material.dart';
import 'package:TOIO/generated/l10n.dart';
import '../../../core/utils/drop_down_list.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.orange.withOpacity(0.2),
            child: const Icon(Icons.language_outlined,
                size: 17, color: Colors.orange),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Text(S.of(context).language,
              style: Theme.of(context).textTheme.bodyLarge!),
          const Spacer(),
          const DropDownList()
        ],
      ),
    );
  }
}
