import 'package:doctor_guid_app/presentation/components/shared/tile_component.dart';
import 'package:doctor_guid_app/presentation/components/shared/tile_separator_component.dart';
import 'package:doctor_guid_app/presentation/pages/topic_page.dart';
import 'package:doctor_guid_app/presentation/utils/navigator.dart';
import 'package:doctor_guid_app/provider/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(appDataProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: TextField(
              cursorColor: Colors.yellow,
              style: const TextStyle(
                color: Colors.white,
              ),
              onChanged: (value) =>
                  ref.watch(appDataProvider.notifier).performSearch(value),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                hintText: 'Search',
              ),
            ),
          ),
          SliverList.separated(
            itemCount: data.topics.length,
            itemBuilder: (context, index) {
              return TileComponent(
                onTap: () {
                  navigate(context, TopicPage(topic: data.topics[index]));
                },
                title: data.topics[index].title,
                leadingIcon: Icons.search_outlined,
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
