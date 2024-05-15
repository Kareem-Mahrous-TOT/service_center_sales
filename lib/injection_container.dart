import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:service_center_sales/domain/repos.dart';
import 'package:service_center_sales/view/blocs/auth/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'app/commands/change_status_command_impl.dart';
import 'core/core.dart';
import 'data/data.dart';
import 'view/blocs/contact_details/contact_details_bloc.dart';
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
    getIt.registerLazySingleton<AuthDataSource>(
        () => AuthDataSourceImpl(apiConsumer: getIt()));
  }

  static void injectRepos() {
    getIt.registerLazySingleton<ContactRepo>(
        () => ContactRepoImpl(contactDatasource: getIt()));
    getIt.registerLazySingleton<AuthRepo>(
        () => AuthRepoImpl(authDataSource: getIt()));
  }

  static void injectCommands() {
    getIt.registerLazySingleton<LoginCommand>(
        () => LoginCommandImpl(authRepo: getIt()));
    getIt.registerLazySingleton<ChangeStatusCommand>(
        () => ChangeStatusCommandImpl(contactRepo: getIt()));
  }

  static void injectQueries() {
    getIt.registerLazySingleton<GetContactsQuery>(
        () => GetContactsQueryImpl(contactRepo: getIt()));
  }

  static void injectUsecases() {
    getIt.registerLazySingleton<LoginUsecase>(
        () => LoginUsecase(loginCommand: getIt(), sharedPrefs: getIt()));
  }

  static void injectBlocs() {
    getIt.registerLazySingleton(() => ContactsBloc(getContactsQuery: getIt()));
    getIt.registerLazySingleton(
        () => ContactDetailsBloc(changeStatusCommand: getIt()));
    getIt.registerLazySingleton(() => AuthBloc(loginUsecase: getIt()));
  }
}
