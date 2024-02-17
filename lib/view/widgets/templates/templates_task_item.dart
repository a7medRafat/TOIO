import 'package:TOIO/controller/app_cubit.dart';
import 'package:TOIO/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../config/colors.dart';
import '../../../config/icons_broken.dart';
import '../../../core/shared_preferances/cache_helper.dart';

class TemplatesTaskItem extends StatelessWidget {
  const TemplatesTaskItem({
    super.key,
    required this.map,
    required this.backColor,
  });

  final Map map;
  final Color backColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: backColor,
          boxShadow: [
            if (CacheHelper.getBoolean(key: 'isDark') == false)
              BoxShadow(
                color: AppColors().favColor,
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 4), // changes position of shadow
              ),
          ],
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(AppCubit.get(context).formatDate(map),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.blueGrey)),
                        Text(' ${S.of(context).at} ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.blueGrey)),
                        Text(AppCubit.get(context).formatDay(map),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.blueGrey)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${map['title']}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              map['type'] == 'Personal'
                  ? Icon(
                      IconBroken.Profile,
                      color: Theme.of(context).iconTheme.color,
                    )
                  : Icon(
                      IconBroken.Work,
                      color: Theme.of(context).iconTheme.color,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
