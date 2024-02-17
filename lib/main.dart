import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:TOIO/controller/app_cubit.dart';
import 'package:TOIO/core/shared_preferances/cache_helper.dart';
import 'App/bloc_observer.dart';
import 'App/myapp.dart';
import 'app/injuctoin_container.dart' as di;
import 'core/notification/local.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await di.init();
  await  di.sl<AppCubit>().initDatabase();
  tz.initializeTimeZones();
  LocalNotifications.init();
  runApp(MyApp());
}
