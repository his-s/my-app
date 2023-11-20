import 'package:data_entery/main.dart';
import 'package:data_entery/models/medical_content.dart';
import 'package:data_entery/models/medical_section.dart';
import 'package:data_entery/views/custom_scaffold_page.dart';
import 'package:data_entery/views/topic_page.dart';
import 'package:data_entery/views/topics_view.dart';
import 'package:data_entery/widgets/expanded_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class TopicSectionView extends StatelessWidget {
  const TopicSectionView(
      {super.key,
      required this.title,
      required this.medicalSection,
      required this.content});
  final String title;
  final MedicalSection medicalSection;
  final MedicalContent content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, customPageRoute(TopicPage(content: content)));
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, customPageRoute(const HomePage()));
                  },
                  icon: const Icon(Icons.home_outlined))
            ],
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 40,
                  alignment: Alignment.centerLeft,
                  color: Colors.indigo,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    medicalSection.title.title(),
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MarkdownB(medicalSection: medicalSection),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
