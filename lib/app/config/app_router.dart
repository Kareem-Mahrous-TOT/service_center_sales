import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:service_center_sales/view/screens/contacts_screen.dart';

import '../../view/screens/contact_status_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

abstract class Routes {
  static const loginRoute = "login";
  static const contactRoute = "contact";
  static const contactStatusRoute = "contactStatus";
}

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: navigatorKey,
  initialLocation: "/${Routes.loginRoute}",
  routes: [
    GoRoute(
      name: Routes.loginRoute,
      path: "/${Routes.loginRoute}",
      redirect: (context, state) => '/',
    ),
    GoRoute(
        path: '/',
        name: Routes.contactRoute,
        builder: (context, state) {
          return const ContactsScreen();
        },
        routes: [
          GoRoute(
            name: Routes.contactStatusRoute,
            path: "${Routes.contactStatusRoute}/:id",
            builder: (context, state) {
              final contactId = int.parse(state.pathParameters['id'] as String);
              return ContactStatusScreen(id: contactId);
            },
          ),
          // GoRoute(
          //   name: Routes.packgeDetailsRoute,
          //   path: "${Routes.packgeDetailsRoute}/:id",
          //   builder: (context, state) {
          //     final categoryId =
          //         int.parse(state.pathParameters['id'] as String);
          //     return ServicePackageScreen(servicePackageId: categoryId);
          //   },
          // ),
          // GoRoute(
          //   name: Routes.serviceDetailsRoute,
          //   path: "${Routes.serviceDetailsRoute}/:id",
          //   builder: (context, state) {
          //     final serviceId = int.parse(state.pathParameters['id'] as String);
          //     return ServiceDetailsScreen(serviceId: serviceId);
          //   },
          // ),
        ])
  ],
);
