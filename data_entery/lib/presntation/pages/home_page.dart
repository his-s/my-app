import 'dart:math' show Random;

import 'package:data_entery/core/constants/app_images.dart';
import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/presntation/pages/pages.dart';
import 'package:data_entery/presntation/pages/sign_in.dart';
import 'package:data_entery/providers/app_data_provider.dart';
import 'package:data_entery/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'topics_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            primary: true,
            title: Text(
              "QuickToBe",
              style: GoogleFonts.roboto(),
            ),
            actions: [
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  final authState = ref.watch(authStateProvider.notifier);

                  return IconButton(
                    onPressed: () {
                      if (authState.user) {
                        navigate(const AccountPage(), context);
                      } else {
                        navigate(const SignUp(), context);
                      }
                    },
                    icon: const Icon(Ionicons.person_circle_outline),
                  );
                },
              ),
            ],
            foregroundColor: Colors.black,
            floating: true,
            centerTitle: true,
            leadingWidth: 45,
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  customPageRoute(
                    const SearchPage(),
                  ),
                );
              },
              icon: const Icon(Ionicons.search),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 56,
                    child: Image.asset(
                      appLogo,
                      filterQuality: FilterQuality.medium,
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
                      'Chapters',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SliverPersistentHeader(
          //   pinned: true,
          //   delegate: MySliverPersistentHeaderDelegate(),
          // ),
          Consumer(builder: (context, ref, child) {
            final appData = ref.watch(appDataProvider);

            return SliverGrid.builder(
              itemCount: appData.categories.length,
              itemBuilder: (context, index) {
                final title = appData.categories[index].title;
                final sections = appData.categories[index].sections;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        customPageRoute(
                          TopicsView(
                            title: title,
                            sections: sections,
                            image: chaptersImg.length < index + 1
                                ? noImage
                                : chaptersImg[index],
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          color: Colors.grey.shade200,
                          height: 90,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...title.split(" ").toList().map((e) {
                                      if (e.toLowerCase() ==
                                              "Emergency".toLowerCase() ||
                                          e.toLowerCase() ==
                                              "clinic".toLowerCase()) {
                                        return Text(
                                          e,
                                          style: GoogleFonts.roboto(
                                            fontSize: 13,
                                          ),
                                        );
                                      }
                                      return Text(
                                        e,
                                        style: GoogleFonts.roboto(
                                          fontSize: 20,
                                        ),
                                      );
                                    }).toList(),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 120,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: getRandomColor(),
                                        ),
                                      ),
                                    ),
                                  ]),
                              const Spacer(),
                            ],
                          ),
                        ),
                        Hero(
                          tag: title,
                          child: SizedBox(
                            height: 113,
                            child: Image.asset(
                              chaptersImg.length < index + 1
                                  ? noImage
                                  : chaptersImg[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                mainAxisExtent: 125,
              ),
            );
          })
        ],
      ),
    );
  }
}

Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256), // Red
    random.nextInt(256), // Green
    random.nextInt(256), // Blue
  );
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  MySliverPersistentHeaderDelegate(this.child);
  @override
  double get minExtent => 4.0; // Minimum height of the header when not pinned

  @override
  double get maxExtent => 4.0; // Maximum height of the header when pinned

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Determine if the header is pinned or not
    // bool isPinned = shrinkOffset <= maxExtent && shrinkOffset >= minExtent;

    // Set the background color based on whether the header is pinned or not
    // Color backgroundColor = isPinned ? const Color(0xFFF3EDF6) : Colors.white;
    return child;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // Determine if the content needs to be rebuilt when parameters change
    return false;
  }
}
