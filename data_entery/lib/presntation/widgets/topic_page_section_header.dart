import 'package:data_entery/data/models/articles_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicBarSectionHeader extends StatelessWidget {
  const TopicBarSectionHeader({
    super.key,
    required this.medicalSection,
  });

  final Subsection medicalSection;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 40,
      alignment: Alignment.centerLeft,
      color: Colors.indigo,
      width: MediaQuery.of(context).size.width,
      child: Text(
        medicalSection.title,
        style: GoogleFonts.roboto(
          color: Colors.white,
        ),
      ),
    );
  }
}
