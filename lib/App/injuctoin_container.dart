import 'package:get_it/get_it.dart';
import '../controller/app_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<AppCubit>(() => AppCubit());
}
