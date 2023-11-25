import 'package:data_entery/data/models/articles_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'markdown_image.dart';

class MarkdownB extends StatelessWidget {
  const MarkdownB({
    super.key,
    required this.medicalSection,
    required this.blockScroll,
  });
  final Function(bool value) blockScroll;
  final Subsection medicalSection;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
      selectable: true,
      styleSheet: MarkdownStyleSheet(
        textAlign: WrapAlignment.start,
        h3: GoogleFonts.roboto(),
        h2: GoogleFonts.roboto(),
        h1: GoogleFonts.roboto(),
        p: GoogleFonts.roboto(),
      ),
      data: medicalSection.data.toString(),
      imageBuilder: (uri, title, alt) {
        return MarkdownImage(
          url: uri.toString(),
          neverScroll: blockScroll,
        );
      },
    );
  }
}
