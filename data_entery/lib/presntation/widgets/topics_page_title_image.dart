import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicsPageTilteImage extends StatelessWidget {
  const TopicsPageTilteImage({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: title,
          child: SizedBox(
            height: 56,
            child: Image.asset(
              image,
              filterQuality: FilterQuality.medium,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(),
            ),
          ),
          child: Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
