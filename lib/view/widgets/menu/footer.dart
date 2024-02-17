import 'package:TOIO/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../config/colors.dart';

class MenuFooter extends StatelessWidget {
  const MenuFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).good,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors().favColor.withOpacity(0.5),
                  )),
          const SizedBox(height: 5),
          Text(S.of(context).consistency,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors().favColor, fontSize: 18)),
        ],
      ),
    );
  }
}
