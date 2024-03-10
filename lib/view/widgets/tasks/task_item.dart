import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:TOIO/config/colors.dart';
import 'package:TOIO/core/shared_preferances/cache_helper.dart';
import 'package:TOIO/view/widgets/slidable_action.dart';

import '../../../controller/app_cubit.dart';

// ignore: must_be_immutable
class BuildTaskItem extends StatefulWidget {
  final Map model;
  final BuildContext context;
  TextDecoration deco = TextDecoration.lineThrough;
  TextDecoration deco2 = TextDecoration.none;

  BuildTaskItem({
    super.key,
    required this.model,
    required this.context,
  });

  @override
  State<BuildTaskItem> createState() => _BuildTaskItemState();
}

class _BuildTaskItemState extends State<BuildTaskItem> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  const SizedBox(width: 5),
                  SlidableActions(
                    function: (context) {
                      widget.model['isFav'] == 'no'
                          ? AppCubit.get(context)
                              .updateFavTask(fav: 'yes', id: widget.model['id'])
                          : AppCubit.get(context)
                              .updateFavTask(fav: 'no', id: widget.model['id']);
                    },
                    icon: CupertinoIcons.heart,
                    backColor: Colors.redAccent.withOpacity(0.2),
                  ),
                  const SizedBox(width: 5),
                  SlidableActions(
                      function: (context) {
                        setState(() {
                          AppCubit.get(context)
                              .deleteTask(id: widget.model['id']);
                        });
                      },
                      icon: CupertinoIcons.delete_simple,
                      backColor: Colors.grey.withOpacity(0.2)),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  boxShadow: [
                    if (CacheHelper.getBoolean(key: 'isDark') == false)
                      BoxShadow(
                        color: AppColors().favColor,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                  ],
                  color: widget.model["isFav"] == 'yes'
                      ? AppColors().favouriteColor
                      : Theme.of(context).cardColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            if (widget.model['status'] == 'new') {
                              setState(() {
                                AppCubit.get(context).updateData(
                                    status: 'done', id: widget.model['id']);
                              });
                            } else {
                              setState(() {
                                AppCubit.get(context).updateData(
                                    status: 'new', id: widget.model['id']);
                              });
                            }
                          },
                          icon: widget.model['status'] == 'done'
                              ? Icon(CupertinoIcons.check_mark_circled_solid,
                                  size: 20,
                                  color: widget.model['type'] == 'Personal'
                                      ? AppColors()
                                          .personalColor
                                          .withOpacity(0.3)
                                      : AppColors()
                                          .bussinesslColor
                                          .withOpacity(0.3))
                              : Icon(
                                  Icons.circle_outlined,
                                  size: 25,
                                  color: widget.model['type'] == 'Business'
                                      ? AppColors().bussinesslColor
                                      : AppColors().personalColor,
                                )),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text('${widget.model["title"]}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    decoration: widget.model["status"] == 'done'
                                        ? widget.deco
                                        : widget.deco2,
                                    decorationThickness: 2,
                                    decorationColor:
                                        widget.model["type"] == 'Personal'
                                            ? AppColors().personalColor
                                            : AppColors().bussinesslColor)),
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
