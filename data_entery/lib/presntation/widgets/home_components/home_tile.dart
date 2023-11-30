import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/presntation/pages/topics_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../shared_components/random_color_line.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.title,
    required this.sections,
    required this.img,
  });

  final String title;
  final List<Section> sections;
  final String img;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          customPageRoute(
            TopicsView(
              title: title,
              sections: sections,
              image: img,
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            color: Colors.grey.shade200,
            height: 90,
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.split(' ').first,
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      title.split(' ').last,
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const RandomColorLine(),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          Hero(
            tag: title,
            child: SizedBox(
              height: 113,
              child: Image.asset(
                img,
                filterQuality: FilterQuality.medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
