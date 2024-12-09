import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/bottom_navigation.dart';
import 'package:flutter_application_1/funcionalidades/create_account/view/create_account_confirmation.dart';
import 'package:flutter_application_1/funcionalidades/event_details/view/event_confirmation.dart';
import 'package:flutter_application_1/funcionalidades/event_details/view/event_details_screen.dart';
import 'package:flutter_application_1/funcionalidades/event_details/view/event_subscription.dart';
import 'package:flutter_application_1/funcionalidades/forget_password/view/forgot_password_confirmation.dart';
import 'package:flutter_application_1/funcionalidades/history/view/history.dart';
import 'package:flutter_application_1/funcionalidades/home/view/home_screen.dart';
import 'package:flutter_application_1/funcionalidades/profile/view/profile_screen.dart';
import 'package:flutter_application_1/model/event/event.dart';
import 'package:flutter_application_1/model/usuario.dart'; // Importe a classe Usuario
import 'package:go_router/go_router.dart';

import 'funcionalidades/create_account/view/create_account_screen.dart';
import 'funcionalidades/forget_password/view/forgot_password_screen.dart';
import 'funcionalidades/sign_in/view/sign_in_screen.dart';

final _mainKey = GlobalKey<NavigatorState>();
final _homeKey = GlobalKey<NavigatorState>();
final _historicoKey = GlobalKey<NavigatorState>();
final _perfilKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _mainKey,
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
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return BottomNavigation(child: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _homeKey,
              routes: [
                GoRoute(
                  name: 'home',
                  path: 'home',
                  builder: (BuildContext context, GoRouterState state) {
                    return const HomeScreen();
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      name: 'event-details',
                      path: 'event-details',
                      builder: (BuildContext context, GoRouterState state) {
                        final Event event = state.extra as Event;
                        return EventDetailsScreen(event: event);
                      },
                    ),
                    GoRoute(
                      name: 'event-subscription',
                      path: 'event-subscription',
                      builder: (BuildContext context, GoRouterState state) {
                        final Event event = state.extra as Event;
                        return EventSubscription(event: event);
                      },
                    ),
                    GoRoute(
                      name: 'event-confirmation',
                      path: 'event-confirmation',
                      builder: (BuildContext context, GoRouterState state) {
                        return const EventConfirmation();
                      },
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _historicoKey,
              routes: [
                GoRoute(
                  name: 'history',
                  path: 'history',
                  builder: (BuildContext context, GoRouterState state) {
                    return const History();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _perfilKey,
              routes: [
                GoRoute(
                  name: 'profile-settings',
                  path: '/profile-settings',
                  builder: (BuildContext context, GoRouterState state) {
                    final usuario = Usuario(
                        nome: 'Wildson Caio Felipe',
                        email: 'wildson.felipe@edu.sc.senai.br',
                        dataNascimento: '08/04/1997',
                        cpf: '451.234.543-12');
                    return UserProfileScreen(usuario: usuario);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
