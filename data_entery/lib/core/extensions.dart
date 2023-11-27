import 'package:data_entery/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

extension NavigationThroughString on String {
  Future<dynamic> pushName() async {
    return AppConstants.navigationKey.currentState?.pushNamed(
      this,
    );
  }
}

extension ContextExtension on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  void showSnackBar(String? message, {bool isError = false}) =>
      ScaffoldMessenger.of(this)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message ?? ''),
          ),
        );
}

extension Title on String {
  String get title => characters.first.toUpperCase() + substring(1);
}

extension Premium on DateTime {
  String premium(int days) {
    final date = add(Duration(days: days * 30));
    return '${date.year}/${date.month}/${date.day}';
  }
}
