import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../config/icons_broken.dart';
import '../../controller/app_cubit.dart';

class DropDownList extends StatelessWidget {
  const DropDownList({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        alignment: AlignmentDirectional.topStart,
        customButton: const Icon(
          IconBroken.Arrow___Down_2,
        ),
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item,context),
            ),
          ),
           const DropdownMenuItem<Divider>(enabled: false, child: Divider(color: Colors.grey,thickness: 0.3)),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item,context),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value! as MenuItem);
        },

        dropdownStyleData: DropdownStyleData(
          direction: AppCubit.get(context).arabicLang ?DropdownDirection.right :DropdownDirection.left ,
          width: 90,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          offset: const Offset(0, 8),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 48),
            8,
            ...List<double>.filled(MenuItems.secondItems.length, 48),
          ],
          padding: const EdgeInsets.only(left: 16, right: 16),
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
  });

  final String text;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [english];
  static const List<MenuItem> secondItems = [arabic];

  static const english = MenuItem(text: 'english');
  static const arabic = MenuItem(text: 'arabic',);

  static Widget buildItem(MenuItem item, BuildContext context) {
    return Text(
      item.text,
      style:Theme.of(context).textTheme.bodyMedium
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.english:
        if(AppCubit.get(context).arabicLang == true){
          AppCubit.get(context).changLang();
        }
        break;
      case MenuItems.arabic:
        if(AppCubit.get(context).arabicLang == false){
          AppCubit.get(context).changLang();
        }
        break;
    }
  }
}
