import 'package:flutter/material.dart';

navigate(BuildContext context, Widget child) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => child),
  );
}
