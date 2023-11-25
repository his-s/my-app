import 'package:data_entery/data/models/model.dart';
import 'package:data_entery/presntation/widgets/widgets.dart';
import 'package:data_entery/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopicsView extends StatelessWidget {
  const TopicsView({
    super.key,
    required this.title,
    required this.sections,
    required this.image,
  });

  final String title;
  final String image;
  final List<Section> sections;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(title),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TopicsPageTilteImage(title: title, image: image),
            ),
          ),
          Consumer(
            builder: (_, WidgetRef ref, __) {
              final appUser = ref.watch(userStateProvider);

              return SliverGrid.builder(
                itemCount: sections.length,
                itemBuilder: (context, index) {
                  final title = sections[index].title;
                  final sec = sections[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: getListTile(appUser, sec, title),
                  );
                },
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 600,
                  mainAxisExtent: 95,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget getListTile(AppUser user, Section sec, String title) {
  if (user.premium) {
    return TopicsNormalListTileWidget(
      title: title,
      section: sec,
    );
  } else {
    if (sec.premium) {
      return TopicsPremiumListTileWidget(title: title);
    } else {
      return TopicsNormalListTileWidget(
        title: title,
        section: sec,
      );
    }
  }
}
