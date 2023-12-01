import 'package:flutter/material.dart';

class TileSeparator extends StatelessWidget {
  const TileSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black26),
        ),
      ),
    );
  }
}
