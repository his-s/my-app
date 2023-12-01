import 'package:doctor_guid_app/models/topic.dart';
import 'package:flutter/material.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({
    super.key,
    required this.topic,
  });
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(topic.title),
              pinned: true,
            ),
          ];
        },
        body: InteractiveViewer(
          child: ListView.builder(
            itemCount: topic.index.length,
            itemBuilder: (context, index) {
              return Image.asset(
                "assets/book/${topic.index[index]}.png",
                width: MediaQuery.of(context).size.width,
              );
            },
          ),
        ),
      ),
    );
  }
}
