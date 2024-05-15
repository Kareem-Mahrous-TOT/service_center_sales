import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/enums/contact_status.dart';
import '/view/screens/auth_screen.dart';
import '/view/screens/contacts_screen.dart';

import '../../view/screens/contact_details_screen.dart';

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
      builder: (context, state) => const AuthScreen(),
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
            path: "${Routes.contactStatusRoute}/:id/:status",
            builder: (context, state) {
              final contactId = int.parse(state.pathParameters['id'] as String);
              final status = state.pathParameters['status'] as String;
              return ContactDetailsScreen(
                id: contactId,
                currentStatus: ContactStatus.fromString(status),
              );
            },
          ),
        ])
  ],
);
