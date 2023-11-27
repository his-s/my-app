import 'package:data_entery/core/constants/app_images.dart';
import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/presntation/pages/home_page.dart';
import 'package:data_entery/presntation/pages/topic_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicsNormalListTileWidget extends StatelessWidget {
  const TopicsNormalListTileWidget(
      {super.key, required this.title, required this.section});
  final String title;
  final Section section;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.shade200,
      contentPadding:
          const EdgeInsets.only(right: 0, left: 10, top: 2, bottom: 2),
      title: Text(
        title,
        style: GoogleFonts.roboto(color: Colors.black),
      ),
      leading: Image.asset(
        topicImg,
        filterQuality: FilterQuality.medium,
      ),
      subtitle: Container(
        width: 150,
        height: 3,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: getRandomColor(),
            ),
          ),
        ),
      ),
      onTap: () {
        navigate(TopicPage(content: section), context);
      },
      trailing: const SizedBox(
        width: 30,
      ),
      // trailing: IconButton(
      //   onPressed: () {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //         content: Text('Under Development'),
      //       ),
      //     );
      //   },
      //   icon: const Icon(
      //     Icons.bookmark_outline,
      //     size: 20,
      //   ),
      // ),
    );
  }
}
