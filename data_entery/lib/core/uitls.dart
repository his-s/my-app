import 'package:flutter/material.dart';

navigate(Widget child, BuildContext context) {
  Navigator.push(
    context,
    customPageRoute(
      child,
    ),
  );
}

PageRouteBuilder customPageRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // const begin = Offset(1.0, 0.0);
      // const end = Offset.zero;
      const curve = Curves.easeInOut;
      var fade = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
      // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      // var offsetAnimation = animation.drive(tween);
      var fadeAnimation = animation.drive(fade);

      return FadeTransition(
        // position: offsetAnimation,
        opacity: fadeAnimation,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}

// extension on String {
//   String title() {
//     return substring(0, 1).toUpperCase() +
//         substring(
//           1,
//         );
//   }
// }
