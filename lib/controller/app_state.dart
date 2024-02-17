part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppChangeNavBarState extends AppState {}

class CreateDatabaseState extends AppState {}

class InsertDatabaseState extends AppState {}

class GetDataFromDatabaseSuccessState extends AppState {}
class GetAllTasksSuccessState extends AppState {}

class GetFavTasksSuccessState extends AppState {}

class GetBusinessTasksSuccessState extends AppState {}

class GetPersonalTasksSuccessState extends AppState {}

class UpdateDatabaseSuccessState extends AppState {}

class UpdateFavTasksSuccessState extends AppState {}

class TaskInsertedSuccessState extends AppState {}
class TaskInsertedErrorrState extends AppState {}

class DeleteDataFromDataBaseSuccessState extends AppState {}

class AppChangeButtonSheetState extends AppState {}

class AppChangePersonalTaskTypeColorState extends AppState {}
class AppChangeBusinessTaskTypeColorState extends AppState {}

class AppTimePickerSuccessState extends AppState {}

class AppDatePickerSuccessState extends AppState {}

class TestState extends AppState {}

class AppLineThroughSuccessState extends AppState {}

class AppChangeAppMoodSuccessStates extends AppState {}

class AppChangeAppMoodErrorStates extends AppState {}

class AppTimeChangedSuccessStates extends AppState {}

class AppChangeLayOutColorStates extends AppState {}

class AppContainerColorFunStates extends AppState {}

class AppNewChartStates extends AppState {}

class AppTaskFavStates extends AppState {}

class AppTaskChangeFavStates extends AppState {}

class AppCurrentTaskStates extends AppState {}

class AppCurrentDayStates extends AppState {}

class AppChangeLangStates extends AppState {}

class AppChangeLangErrorStates extends AppState {}

class GetCompleteDateSuccessState extends AppState {}

class TimeChangedSuccessState extends AppState {}

class DayTimePickerSuccessState extends AppState {}




