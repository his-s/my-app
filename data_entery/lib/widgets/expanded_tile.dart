import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_entery/models/medical_content.dart';
import 'package:data_entery/models/medical_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandedTile extends StatelessWidget {
  const ExpandedTile({super.key, required this.medicalSection});
  final MedicalSection medicalSection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key,
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () {
          // log('i');
        },
        child: ExpansionTile(
          initiallyExpanded: true,
          tilePadding: const EdgeInsets.all(0),
          leading: VerticalDivider(
            thickness: 5.5,
            color: Colors.blue.shade300,
          ),
          maintainState: true,
          backgroundColor: Colors.transparent,
          collapsedBackgroundColor: Colors.transparent,
          iconColor: Colors.blue.shade300,
          collapsedIconColor: Colors.blue.shade400,
          textColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          expandedAlignment: Alignment.centerLeft,
          childrenPadding: const EdgeInsets.all(10),
          title: Text(medicalSection.title),
          children: [
            MarkdownBody(
              selectable: true,
              styleSheet: MarkdownStyleSheet(
                h3: GoogleFonts.roboto(),
                h2: GoogleFonts.roboto(),
                h1: GoogleFonts.roboto(),
                p: GoogleFonts.roboto(),
              ),
              data: medicalSection.data,
              imageBuilder: (uri, title, alt) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: CachedNetworkImage(
                      imageUrl: uri.toString(),
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
