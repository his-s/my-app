import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:data_entery/data/data_state_notifier.dart';
import 'package:data_entery/main.dart';
import 'package:data_entery/views/create_data.dart';
import 'package:data_entery/views/search_page.dart';
import 'package:data_entery/views/topics_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../core/constants/app_images.dart';
import 'branch_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  bool isStartScroll = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _onScroll();
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels == 0) {
      // The scroll has just started
      setState(() {
        isStartScroll = true;
      });
      print('Scroll started');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, customPageRoute(const CreateDataPage()));
        },
        child: const Icon(Icons.create),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.indigoAccent,
      //   foregroundColor: Colors.white,
      //   title: const Text('QuickToBe'),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         navigate(const SearchPage(), context);
      //       },
      //       icon: const Icon(Icons.search),
      //     )
      //   ],
      // ),

      // body: Consumer(builder: (context, ref, child) {
      //   final appData = ref.watch(appDataProvider);

      //   return Column(
      //     children: [
      //       Expanded(
      //         child: ListView.builder(
      //           itemCount: appData.medicals.length,
      //           itemBuilder: (context, index) {
      //             final title = appData.medicals[index].title;
      //             final sections = appData.medicals[index].sections;
      //             return ListTile(
      //               leading: const Icon(Icons.lock_open),
      //               title: Text(title),
      //               onTap: () {
      //                 navigate(
      //                   BranchsView(title: title, sections: sections),
      //                   context,
      //                 );
      //               },
      //             );
      //           },
      //         ),
      //       )
      //     ],
      //   );
      // }),
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
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline),
              ),
            ],
            foregroundColor: Colors.black,
            floating: true,
            centerTitle: true,
            leadingWidth: 45,
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Navigator.push(context, customPageRoute(const SearchPage()));
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
            return SliverList.builder(
              itemCount: appData.medicals.length,
              itemBuilder: (context, index) {
                final title = appData.medicals[index].title;
                final sections = appData.medicals[index].sections;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          customPageRoute(TopicsView(
                              title: title,
                              sections: sections,
                              image: chaptersImg[index])));
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
                                          "Emergency".toLowerCase()) {
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
                                    )
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
                              chaptersImg[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
    bool isPinned = shrinkOffset <= maxExtent && shrinkOffset >= minExtent;

    // Set the background color based on whether the header is pinned or not
    Color backgroundColor = isPinned ? const Color(0xFFF3EDF6) : Colors.white;
    return child;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // Determine if the content needs to be rebuilt when parameters change
    return false;
  }
}
