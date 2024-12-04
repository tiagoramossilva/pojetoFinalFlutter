import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'funcionalidades/create_account/view/create_account_screen.dart';
import 'funcionalidades/forget_password/view/forget_password_screen.dart';
import 'funcionalidades/sign_in/view/sign_in_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SignIn();
      },
      routes: <RouteBase>[
        GoRoute(
          name: 'create-account',
          path: 'create-account',
          builder: (BuildContext context, GoRouterState state) {
            return const CreateAccountScreen();
          },
        ),
        GoRoute(
          name: 'forget-password',
          path: 'forget-password',
          builder: (BuildContext context, GoRouterState state) {
            return const ForgetPassword();
          },
        ),
      ],
    ),
  ],
);
