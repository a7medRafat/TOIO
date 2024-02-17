import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MySnackBar {
  snackBarMessage(context, String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(

          SnackBar(
              margin: EdgeInsets.only(
                  left: 10,
                  right: 10),
              behavior: SnackBarBehavior.floating,
              padding: const EdgeInsets.all(20),
              backgroundColor:Theme.of(context).scaffoldBackgroundColor,
              elevation: 2,
              content: Text(
                msg,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall!,
              )));
}

