import 'package:doctor_guid_app/models/topic.dart';
import 'package:doctor_guid_app/presentation/components/shared/tile_component.dart';
import 'package:doctor_guid_app/presentation/components/shared/tile_separator_component.dart';
import 'package:doctor_guid_app/presentation/pages/topic_page.dart';
import 'package:doctor_guid_app/presentation/utils/navigator.dart';
import 'package:flutter/material.dart';

class TopicsPage extends StatelessWidget {
  const TopicsPage({super.key, required this.topics, required this.title});
  final List<Topic> topics;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(title),
            pinned: true,
            floating: false,
          ),
          SliverList.separated(
            itemCount: topics.length,
            itemBuilder: (context, index) {
              return TileComponent(
                leadingIcon: Icons.diamond_outlined,
                title: topics[index].title,
                onTap: () {
                  navigate(
                    context,
                    TopicPage(
                      topic: topics[index],
                    ),
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const TileSeparator();
            },
          )
        ],
      ),
    );
  }
}
