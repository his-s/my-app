import 'package:data_entery/core/uitls.dart';
import 'package:flutter/material.dart';

class RandomColorLine extends StatelessWidget {
  const RandomColorLine({super.key, this.width = 120});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: getRandomColor(),
        ),
      ),
    );
  }
}
