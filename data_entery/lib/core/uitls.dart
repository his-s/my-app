import 'dart:math';

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
Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256), // Red
    random.nextInt(256), // Green
    random.nextInt(256), // Blue
  );
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  MySliverPersistentHeaderDelegate(this.child);
  @override
  double get minExtent => 4.0; // Minimum height of the header when not pinned

  @override
  double get maxExtent => 4.0; // Maximum height of the header when pinned

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Determine if the header is pinned or not
    // bool isPinned = shrinkOffset <= maxExtent && shrinkOffset >= minExtent;

    // Set the background color based on whether the header is pinned or not
    // Color backgroundColor = isPinned ? const Color(0xFFF3EDF6) : Colors.white;
    return child;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // Determine if the content needs to be rebuilt when parameters change
    return false;
  }
}
