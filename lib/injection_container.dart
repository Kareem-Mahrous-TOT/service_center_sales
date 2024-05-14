import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:service_center_sales/domain/repos.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'core/core.dart';
import 'data/data.dart';
import 'view/view.dart';

final getIt = GetIt.instance;

Future initDependencies() async {
  await InjectionHelper.injectExternal();
  InjectionHelper.injectCore();
  InjectionHelper.injectDatasources();
  InjectionHelper.injectRepos();
  InjectionHelper.injectQueries();
  InjectionHelper.injectCommands();
  InjectionHelper.injectUsecases();
  InjectionHelper.injectBlocs();
}

abstract class InjectionHelper {
  static Future<void> injectExternal() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPrefs>(
        () => SharedPrefsImpl(sharedPreferences: sharedPreferences));
    getIt.registerLazySingleton(() => AppInterceptors());
    getIt.registerLazySingleton(() => LogInterceptor(
          requestBody: true,
          responseBody: true,
        ));
    getIt.registerLazySingleton(() => Dio());
  }

  static void injectCore() {
    getIt.registerLazySingleton<ApiConsumer>(
        () => DioConsumer(client: getIt(), interceptors: [
              getIt<AppInterceptors>(),
              if (kDebugMode) getIt<LogInterceptor>(),
            ]));
  }

  static void injectDatasources() {
    getIt.registerLazySingleton<ContactDataSource>(
        () => ContactDataSourceImpl(apiConsumer: getIt()));
  }

  static void injectRepos() {
    getIt.registerLazySingleton<ContactRepo>(
        () => ContactRepoImpl(contactDatasource: getIt()));
  }

  static void injectCommands() {
    getIt.registerLazySingleton<LoginCommand>(
        () => LoginCommandImpl(authRepo: getIt()));
  }

  static void injectQueries() {
    getIt.registerLazySingleton<GetContactsQuery>(
        () => GetContactsQueryImpl(contactRepo: getIt()));
  }

  static void injectUsecases() {}

  static void injectBlocs() {
    getIt.registerLazySingleton(() => ContactsBloc(getContactsQuery: getIt()));
  }
}
