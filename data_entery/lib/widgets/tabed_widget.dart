import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tabed extends StatelessWidget {
  const Tabed({super.key, required this.title, required this.onTab});
  final String title;
  final Function() onTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Colors.black45,
        ),
      )),
      child: Row(
        children: [
          const Icon(Icons.lock),
          Expanded(
            child: InkWell(
              onTap: onTab,
              child: Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
