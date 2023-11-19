import 'package:flutter/material.dart';

import '../models/model.dart';
import 'preview_page.dart';
import 'topic_page.dart';

class TopicsView extends StatelessWidget {
  const TopicsView({
    super.key,
    required this.title,
    required this.sections,
  });

  final String title;
  final List<MedicalContent> sections;

  @override
  Widget build(BuildContext context) {
    sections.sort((a, b) => b.title.compareTo(a.title));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left), // Use the chevron left icon
          onPressed: () {
            Navigator.of(context).pop(); // Add your pop logic here
          },
        ),
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, index) {
            final branchtitle = sections[index].title;
            final branchSections = sections[index].sections;
            return ListTile(
              contentPadding:
                  const EdgeInsets.only(right: 0, left: 10, top: 2, bottom: 2),
              title: Text(branchtitle.title()),
              leading: const Icon(
                Icons.vaccines,
                color: Colors.black54,
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
                  )),
            );
          }),
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

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}
