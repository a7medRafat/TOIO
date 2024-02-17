import 'package:flutter/material.dart';
import 'package:TOIO/generated/l10n.dart';

class CategotyTextWidget extends StatelessWidget {

  const CategotyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(S.of(context).categories,
          style:
          Theme.of(context).textTheme.bodyMedium!),
    );
  }
}
