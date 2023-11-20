import 'package:data_entery/core/router/routers.dart';
import 'package:data_entery/views/create_data.dart';
import 'package:data_entery/views/home_page.dart';
import 'package:data_entery/views/topics_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter();
  Route onGenreateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.homePage:
        return customPageRoute(
          const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
