import 'package:data_entery/core/constants/app_images.dart';
import 'package:data_entery/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/model.dart';
import 'preview_page.dart';
import 'topic_page.dart';

class TopicsView extends StatelessWidget {
  const TopicsView({
    super.key,
    required this.title,
    required this.sections,
    required this.image,
  });

  final String title;
  final String image;
  final List<MedicalContent> sections;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(title),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
              ),
            ),
          ),
          SliverList.builder(
              itemCount: sections.length,
              itemBuilder: (context, index) {
                final branchtitle = sections[index].title;
                final branchSections = sections[index].sections;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                    tileColor: Colors.grey.shade200,
                    contentPadding: const EdgeInsets.only(
                        right: 0, left: 10, top: 2, bottom: 2),
                    title: Text(
                      branchtitle.title(),
                    ),
                    leading: Image.asset(
                      topicImg,
                    ),
                    subtitle: Container(
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: getRandomColor(),
                      )),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        customPageRoute(
                          TopicPage(
                            content: sections[index],
                          ),
                        ),
                      );
                    },
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_outline,
                        size: 20,
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

extension on String {
  String title() {
    return substring(0, 1).toUpperCase() +
        substring(
          1,
        );
  }
}

PageRouteBuilder customPageRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var fade = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      var fadeAnimation = animation.drive(fade);

      return FadeTransition(
        // position: offsetAnimation,
        opacity: fadeAnimation,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}
