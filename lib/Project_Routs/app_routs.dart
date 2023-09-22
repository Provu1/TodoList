import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/Project_Routs/routs_name.dart';
import 'package:todolist/Screen/home_screen.dart';
import 'package:todolist/Screen/login_screen.dart';
import 'package:todolist/Screen/register_screen.dart';

class AppRouter {
   static GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: MyAppRouteConstants.RegisterName,
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage(child: RegisterScreen() );
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.homeRouteName,
          path: '/home',
          pageBuilder: (context, state) {
            return  MaterialPage(child: HomeScreen() );
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.loginRouteName,
          path: '/login',
          pageBuilder: (context, state) {
            return  MaterialPage(child: LoginScreen());
          },
        ),
      ],
    );

}