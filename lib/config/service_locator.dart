import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/api/dio_helper.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/api/prefs.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/config/environment.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/ui/home/home_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void setup(Environment environment) {
    getIt.registerSingleton<Dio>(DioHelper.build(environment.baseUrl));
    getIt.registerLazySingleton<PrefsImpl>(() => Prefs());

    // REPOSITORIES

    // BLOCS
    getIt.registerFactory<HomeBloc>(() => HomeBloc());
  }
}
