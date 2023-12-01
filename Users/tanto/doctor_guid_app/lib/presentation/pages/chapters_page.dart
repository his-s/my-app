import 'package:doctor_guid_app/presentation/components/shared/tile_component.dart';
import 'package:doctor_guid_app/presentation/components/shared/tile_separator_component.dart';
import 'package:doctor_guid_app/presentation/pages/topics_page.dart';
import 'package:doctor_guid_app/presentation/utils/navigator.dart';
import 'package:doctor_guid_app/provider/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'search_page.dart';

class ChaptersPage extends StatelessWidget {
  const ChaptersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('D Guide Offline'),
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {
                  navigate(
                    context,
                    const SearchPage(),
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          Consumer(
            builder: (_, WidgetRef ref, __) {
              final data = ref.watch(appDataProvider);
              return SliverList.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return const TileSeparator();
                  },
                  itemCount: data.books.length,
                  itemBuilder: (context, index) {
                    return TileComponent(
                      leadingIcon: Icons.help_outline,
                      title: data.books[index].title,
                      onTap: () {
                        navigate(
                          context,
                          TopicsPage(
                            topics: data.books[index].topics,
                            title: data.books[index].title,
                          ),
                        );
                      },
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
