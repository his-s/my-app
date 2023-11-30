import 'package:data_entery/core/constants/app_images.dart';

import 'package:data_entery/providers/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_tile.dart';

class HomeTiles extends ConsumerWidget {
  const HomeTiles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appData = ref.watch(appDataProvider);

    return SliverGrid.builder(
      itemCount: appData.categories.length,
      itemBuilder: (context, index) {
        final category = appData.categories[index];

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: HomeTile(
            title: category.title,
            sections: category.sections,
            img: chaptersImg[index],
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 600,
        mainAxisExtent: 125,
      ),
    );
  }
}
