import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_center_sales/view/blocs/auth/auth_bloc.dart';
import 'package:service_center_sales/view/blocs/contact_details/contact_details_bloc.dart';

import 'app/config.dart';
import 'core/generated.dart';
import 'injection_container.dart';
import 'view/blocs.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  getIt<ContactsBloc>()..add(GetContactsEvent())),
          BlocProvider(create: (context) => getIt<ContactDetailsBloc>()),
          BlocProvider(create: (context) => getIt<AuthBloc>()),
        ],
        child: MaterialApp.router(
          localizationsDelegates: AppLang.localizationsDelegates,
          supportedLocales: AppLang.supportedLocales,
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
        ));
  }
}
