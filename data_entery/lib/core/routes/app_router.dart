// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/presntation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:data_entery/core/constants/routers.dart';

class AppRouter {
  WidgetRef ref;
  AppRouter(
    this.ref,
  );
  Route onGenreateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.homePage:
        return customPageRoute(
          const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        );
    }
  }
}
