import 'package:data_entery/core/constants/app_images.dart';
import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/presntation/pages/topic_page.dart';
import 'package:data_entery/presntation/pages/topic_view_section.dart';
import 'package:flutter/material.dart';

class SearchNormalListWidget extends StatelessWidget {
  const SearchNormalListWidget({
    super.key,
    required this.searched,
  });

  final Section searched;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        seach,
        scale: 15,
        filterQuality: FilterQuality.medium,
      ),
      tileColor: Colors.grey.shade200,
      title: Text(searched.title),
      subtitle: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(searched.subsections.length, (i) {
            final text = searched.subsections[i].title;
            return TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  customPageRoute(
                    TopicSectionView(
                      content: searched,
                      medicalSection: searched.subsections[i],
                      title: searched.title,
                    ),
                  ),
                );
              },
              child: Text(text),
            );
          }),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          customPageRoute(
            TopicPage(
              content: searched,
              index: 0,
            ),
          ),
        );
      },
    );
  }
}
