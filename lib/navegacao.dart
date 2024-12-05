import 'package:flutter/material.dart';
import 'package:flutter_application_1/funcionalidades/create_account/view/create_account_confirmation.dart';
import 'package:flutter_application_1/funcionalidades/forget_password/view/forgot_password_confirmation.dart';
import 'package:flutter_application_1/funcionalidades/home/view/home_screen.dart';
import 'package:go_router/go_router.dart';

import 'funcionalidades/create_account/view/create_account_screen.dart';
import 'funcionalidades/forget_password/view/forgot_password_screen.dart';
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
          name: 'create-account-confirmation',
          path: 'create-account-confirmation',
          builder: (BuildContext context, GoRouterState state) {
            return const CreateAccountConfirmation();
          },
        ),
        GoRoute(
          name: 'forget-password',
          path: 'forget-password',
          builder: (BuildContext context, GoRouterState state) {
            return const ForgotPasswordScreen();
          },
        ),
        GoRoute(
          name: 'forget-password-confirmation',
          path: 'forget-password-confirmation',
          builder: (BuildContext context, GoRouterState state) {
            return const ForgotPasswordConfirmation();
          },
        ),
        GoRoute(
          name: 'sign-in',
          path: 'sign-in',
          builder: (BuildContext context, GoRouterState state) {
            return const SignIn();
          },
        ),
        GoRoute(
          name: 'home',
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
      ],
    ),
  ],
);
