import 'package:data_entery/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChaptersLogoTitle extends StatelessWidget {
  const ChaptersLogoTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 56,
          child: Image.asset(
            appLogo,
            filterQuality: FilterQuality.medium,
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
            'Chapters',
            style: GoogleFonts.roboto(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
