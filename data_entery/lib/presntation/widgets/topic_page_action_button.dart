import 'package:flutter/material.dart';

class TopicPageActionButton extends StatelessWidget {
  const TopicPageActionButton({
    super.key,
    required this.showFab,
    this.onPressed,
    this.scrollToTop,
  });
  final bool showFab;
  final Function()? onPressed;
  final Function()? scrollToTop;
  @override
  Widget build(BuildContext context) {
    return showFab
        ? FloatingActionButton.small(
            onPressed: scrollToTop,
            child: const Icon(
              Icons.arrow_upward,
              size: 15,
            ),
          )
        : FloatingActionButton.small(
            onPressed: onPressed,
            child: const Icon(
              Icons.create,
              size: 15,
            ),
          );
  }
}
