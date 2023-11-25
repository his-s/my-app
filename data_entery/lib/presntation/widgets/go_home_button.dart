import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/presntation/pages/pages.dart';
import 'package:flutter/material.dart';

class GoHomeButton extends StatefulWidget {
  const GoHomeButton({super.key});

  @override
  State<GoHomeButton> createState() => _GoHomeButtonState();
}

class _GoHomeButtonState extends State<GoHomeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          customPageRoute(
            const HomePage(),
          ),
        );
      },
      icon: const Icon(Icons.home_outlined),
    );
  }
}
