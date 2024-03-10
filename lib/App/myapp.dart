import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:TOIO/controller/app_cubit.dart';
import 'package:TOIO/core/shared_preferances/cache_helper.dart';
import '../config/style.dart';
import '../generated/l10n.dart';
import '../view/screens/splash_screen.dart';
import 'injuctoin_container.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp({super.key});

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  bool? isArabic = CacheHelper.getBoolean(key: 'arabicLang');


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
            value: sl<AppCubit>()
              ..initDatabase()
              ..changeAppMood(fromShared: widget.isDark)
              ..changLang(fromShared: widget.isArabic)),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              locale: AppCubit.get(context).isArabic == true
                  ? const Locale('ar', '')
                  : const Locale('en', ''),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              theme: AppTheme().light,
              darkTheme: AppTheme().dark,
              themeMode: AppCubit.get(context).isDark == true
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const SplashScreen());
        },
      ),
    );
  }
}
