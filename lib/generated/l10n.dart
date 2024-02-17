// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get business {
    return Intl.message(
      'Business',
      name: 'business',
      desc: '',
      args: [],
    );
  }

  /// `Personal`
  String get personal {
    return Intl.message(
      'Personal',
      name: 'personal',
      desc: '',
      args: [],
    );
  }

  /// `CATEGORIES`
  String get categories {
    return Intl.message(
      'CATEGORIES',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Task`
  String get task {
    return Intl.message(
      'Task',
      name: 'task',
      desc: '',
      args: [],
    );
  }

  /// `TODAY`
  String get todayTask {
    return Intl.message(
      'TODAY',
      name: 'todayTask',
      desc: '',
      args: [],
    );
  }

  /// `TOMORROW`
  String get tomorrowTask {
    return Intl.message(
      'TOMORROW',
      name: 'tomorrowTask',
      desc: '',
      args: [],
    );
  }

  /// `THIS MONTH`
  String get thisMonth {
    return Intl.message(
      'THIS MONTH',
      name: 'thisMonth',
      desc: '',
      args: [],
    );
  }

  /// `Personal task`
  String get personalType {
    return Intl.message(
      'Personal task',
      name: 'personalType',
      desc: '',
      args: [],
    );
  }

  /// `Business task`
  String get businessType {
    return Intl.message(
      'Business task',
      name: 'businessType',
      desc: '',
      args: [],
    );
  }

  /// `Enter new task`
  String get enterNewTask {
    return Intl.message(
      'Enter new task',
      name: 'enterNewTask',
      desc: '',
      args: [],
    );
  }

  /// `Templates`
  String get templetas {
    return Intl.message(
      'Templates',
      name: 'templetas',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `All tasks`
  String get allTasks {
    return Intl.message(
      'All tasks',
      name: 'allTasks',
      desc: '',
      args: [],
    );
  }

  /// `Important tasks`
  String get importantTasks {
    return Intl.message(
      'Important tasks',
      name: 'importantTasks',
      desc: '',
      args: [],
    );
  }

  /// `done tasks`
  String get doneTasks {
    return Intl.message(
      'done tasks',
      name: 'doneTasks',
      desc: '',
      args: [],
    );
  }

  /// `No tasks !`
  String get TOIOsks {
    return Intl.message(
      'No tasks !',
      name: 'TOIOsks',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `theme`
  String get theme {
    return Intl.message(
      'theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `help center`
  String get helpCenter {
    return Intl.message(
      'help center',
      name: 'helpCenter',
      desc: '',
      args: [],
    );
  }

  /// `english`
  String get english {
    return Intl.message(
      'english',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `arabic`
  String get arabic {
    return Intl.message(
      'arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `at`
  String get at {
    return Intl.message(
      'at',
      name: 'at',
      desc: '',
      args: [],
    );
  }

  /// `good`
  String get good {
    return Intl.message(
      'good',
      name: 'good',
      desc: '',
      args: [],
    );
  }

  /// `Consistency`
  String get consistency {
    return Intl.message(
      'Consistency',
      name: 'consistency',
      desc: '',
      args: [],
    );
  }

  /// `Stats`
  String get stats {
    return Intl.message(
      'Stats',
      name: 'stats',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
