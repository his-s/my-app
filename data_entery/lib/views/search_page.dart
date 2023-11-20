import 'dart:developer';

import 'package:data_entery/core/constants/app_images.dart';
import 'package:data_entery/data/data_state_notifier.dart';
import 'package:data_entery/views/custom_scaffold_page.dart';
import 'package:data_entery/views/preview_page.dart';
import 'package:data_entery/views/topic_page.dart';
import 'package:data_entery/views/topic_view_section.dart';
import 'package:data_entery/views/topics_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../models/model.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initially, display all items
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    final appData = ref.watch(appDataProvider);
    appData.updateSearch(query);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final appData = ref.watch(appDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        actions: [
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: TextField(
              style: GoogleFonts.roboto(
                color: Colors.white,
              ),
              controller: _searchController,
              onChanged: _performSearch,
              decoration: InputDecoration(
                hintStyle: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
                hintText: 'Search',
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appData.searched.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(
                      seach,
                      scale: 15,
                    ),
                    tileColor: Colors.grey.shade200,
                    title: Text(appData.searched[index].title.title()),
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            appData.searched[index].sections.length, (i) {
                          final text =
                              appData.searched[index].sections[i].title;
                          return TextButton(
                            onPressed: () {
                              log(i.toString());
                              Navigator.push(
                                context,
                                customPageRoute(
                                  TopicSectionView(
                                    content: appData.searched[index],
                                    medicalSection:
                                        appData.searched[index].sections[i],
                                    title: appData.searched[index].title,
                                  ),
                                ),
                              );
                            },
                            child: Text(text),
                          );
                        }),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        customPageRoute(
                          TopicPage(
                            content: appData.searched[index],
                            index: 0,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
