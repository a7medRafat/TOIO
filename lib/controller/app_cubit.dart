import 'package:TOIO/core/snackbar/mysnackbar.dart';
import 'package:TOIO/core/utils/navigation.dart';
import 'package:TOIO/view/screens/drawer_screen.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:TOIO/core/shared_preferances/cache_helper.dart';
import 'package:sqflite/sqflite.dart';

// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;
import '../core/notification/local.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  Database? db;
  static const String tableName = 'toio';

  Future initDatabase() async {
    return await openDatabase('test', version: 1,
            onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $tableName (id INTEGER PRIMARY KEY,title TEXT,time TEXT,date INTEGER ,completeDate TEXT,type TEXT,status TEXT,isFav TEX)');
    }, onOpen: (database) {})
        .then((value) {
      db = value;
      getAllTasks();
      getPersonalTasks();
      getBusinessTasks();
    });
  }

  Future insetToDateBase(
      {required title,
      required time,
      required date,
      required completeDate,
      required type,
      required fav,
      required context}) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    if (completeDateTime!.isAfter(now)) {
      return await db!.transaction((txn) async {
        txn
            .rawInsert(
                'INSERT INTO $tableName (title , time , date , completeDate ,  type , status , isFav )VALUES ("$title"  ,"$time"," $date" , "$completeDate" , "$type"  ,"new" , "$fav")')
            .then((value) {
          CacheHelper.getData(key: 'taskType') == 'Personal'
              ? getPersonalTasks()
              : getBusinessTasks();
          Navigation().navigateTo(context, DrawerScreen());
          getAllTasks();

          LocalNotifications.showScheduleNotification(
              payload: 'aa',
              scheduleDate: selectedDate!.add(Duration(
                  hours: taskTimePicker!.hour,
                  minutes: taskTimePicker!.minute)),
              body: myController.text);
          taskTimePicker = null;
          taskFav = false;
          selectedDate = null;
          myController.clear();
          emit(TaskInsertedSuccessState());
        }).catchError((error) {
          emit(TaskInsertedErrorrState());
        });
      });
    } else {
      StyledToast.show(context: context, text: 'task must be in future');
    }
  }

  List<Map<String, dynamic>> allTasks = [];
  List<Map<String, dynamic>> doneTasks = [];
  List<Map<String, dynamic>> favTasks = [];
  List<Map<String, dynamic>> todaysTasks = [];
  List<Map<String, dynamic>> tomorrowsTasks = [];
  List<Map<String, dynamic>> thisMonthTasks = [];

  Future getAllTasks() async {
    todaysTasks = [];
    tomorrowsTasks = [];
    thisMonthTasks = [];
    allTasks = [];
    doneTasks = [];
    favTasks = [];
    await db!.rawQuery('SELECT * FROM $tableName').then((value) async {
      for (var e in value) {
        DateTime taskDate = DateTime.parse(e['completeDate'].toString());
        if (isToday(taskDate) == true) {
          todaysTasks.add(e);
        }
        if (isTomorrow(taskDate) == true) {
          tomorrowsTasks.add(e);
        } else if (isToday(taskDate) == false &&
            isTomorrow(taskDate) == false) {
          thisMonthTasks.add(e);
        }
        allTasks.add(e);
        if (e['isFav'] == 'yes') {
          favTasks.add(e);
        }
        if (e['status'] == 'done') {
          doneTasks.add(e);
        }
      }
      emit(GetAllTasksSuccessState());
    }).catchError((error) {});
  }

  Future updateData({required String status, required int id}) async {
    await db!.rawUpdate('UPDATE $tableName SET status = ? WHERE id = ?', [
      status,
      id,
    ]).then((value) {
      getAllTasks();
      emit(UpdateDatabaseSuccessState());
    });
  }

  bool isToday(DateTime date) {
    DateTime today = DateTime.now();
    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;
  }

  bool isTomorrow(DateTime date) {
    DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    return date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day;
  }

  List<Map<String, dynamic>> businessTasks = [];
  List<Map<String, dynamic>> personalTasks = [];

  Future getBusinessTasks() async {
    businessTasks = [];
    await db!.rawQuery(
        'SELECT * FROM $tableName WHERE type=?', ['Business']).then((value) {
      businessTasks = value;
      emit(GetBusinessTasksSuccessState());
    });
  }

  Future getPersonalTasks() async {
    personalTasks = [];
    await db!.rawQuery(
        'SELECT * FROM $tableName WHERE type=?', ['Personal']).then((value) {
      personalTasks = value;
      emit(GetPersonalTasksSuccessState());
    });
  }

  Future updateFavTask({required String fav, required int id}) async {
    await db!.rawUpdate('UPDATE $tableName SET isFav = ?   WHERE id = ?', [
      fav,
      id,
    ]).then((value) {
      getAllTasks();
      emit(UpdateFavTasksSuccessState());
    });
  }

  void deleteTask({required int id}) async {
    await db!
        .rawDelete('DELETE FROM $tableName  WHERE id = ?', [id]).then((value) {
      getPersonalTasks();
      getBusinessTasks();
      getAllTasks();
    });
  }

  TimeOfDay? taskTimePicker;
  DateTime? selectedDate;
  DateTime? selectedTimeOdDay;
  String? uiDate;
  DateTime? completeDateTime;

  void getCompleteDate() {
    completeDateTime = DateTime(selectedDate!.year, selectedDate!.month)
        .add(Duration(
            days:
                selectedDate!.day - 1)) // Subtract 1 to convert to 0-based day
        .add(Duration(
            hours: taskTimePicker!.hour, minutes: taskTimePicker!.minute));
  }

  void datePicker(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.parse('2025-03-05'),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      uiDate = DateFormat('dd-MM-yyyy').format(selectedDate!);
      emit(AppDatePickerSuccessState());
    }
  }

  onTimeChanged(value) {
    taskTimePicker = value;
    emit(TimeChangedSuccessState());
  }

  void dayTimePicker(context) {
    Time time = Time(
        hour: DateTime.now().hour,
        minute: DateTime.now().minute,
        second: DateTime.now().second);
    double minH = DateTime.now().hour.toDouble();
    double minM = DateTime.now().minute.toDouble();
    Navigator.of(context).push(showPicker(
      minHour: minH,
      minMinute: minM,
      value: time,
      is24HrFormat: false,
      blurredBackground: true,
      onChange: onTimeChanged,
    ));
    emit(DayTimePickerSuccessState());
  }

  bool taskFav = false;
  String? isFav = 'no';

  favTabbed() {
    taskFav = !taskFav;
    if (isFav == 'no') {
      isFav = 'yes';
    } else {
      isFav = 'no';
    }
    emit(AppTaskChangeFavStates());
  }

  changeFavTask() {
    isFav = 'yes';
    getAllTasks();
  }

  bool isDark = true;

  void changeAppMood({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeAppMoodSuccessStates());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeAppMoodSuccessStates());
      });
    }
  }

  bool isArabic = true;

  changLang({bool? fromShared}) {
    if (fromShared != null) {
      isArabic = fromShared;
      emit(AppChangeLangStates());
    } else {
      isArabic = !isArabic;
      CacheHelper.putBoolean(key: 'arabicLang', value: isArabic).then((value) {
        emit(AppChangeLangStates());
      });
    }
  }

  var iconbtn = Icons.edit;

  bool isButtonEnabled = false;

  var myController = TextEditingController();

  String formatDate(Map map) {
    DateTime date = DateTime.parse(map['completeDate']);
    final formatter = DateFormat('E dd MMM yyyy');
    return formatter.format(date);
  }

  String formatDay(Map map) {
    DateTime date = DateTime.parse(map['completeDate']);
    final formatter = DateFormat('HH : mm');
    return formatter.format(date);
  }
}
