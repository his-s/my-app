import 'dart:developer';

import 'package:data_entery/data/data_state_notifier.dart';
import 'package:data_entery/views/custom_scaffold_page.dart';
import 'package:data_entery/views/preview_page.dart';
import 'package:data_entery/views/topic_page.dart';
import 'package:data_entery/views/topics_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/model.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  // List<String> allItems = [
  //   'Apple',
  //   'Banana',
  //   'Orange',
  //   'Mango',
  //   'Grapes',
  //   'Watermelon',
  //   'Pineapple',
  // ];
  // List<MedicalContent> contents = [];
  // search() {
  //   for (var element in medicals) {
  //     for (var i in element.sections) {
  //       for (var e in i.sections) {
  //         contents.add(e);
  //       }
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();

    // Initially, display all items
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
        leading: IconButton(
          icon: const Icon(Icons.chevron_left), // Use the chevron left icon
          onPressed: () {
            Navigator.of(context).pop(); // Add your pop logic here
          },
        ),
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
        title: const Text('Search Page'),
        actions: [
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: TextField(
              autofocus: true,
              style: GoogleFonts.roboto(
                color: Colors.white,
              ),
              controller: _searchController,
              onChanged: _performSearch,
              decoration: InputDecoration(
                hintStyle: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
                hintText: 'Search...',
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
                return ListTile(
                  title: Text(appData.searched[index].title.title()),
                  subtitle: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          appData.searched[index].sections.length, (i) {
                        final text = appData.searched[index].sections[i].title;
                        return TextButton(
                          onPressed: () {
                            log(i.toString());
                            Navigator.push(
                              context,
                              customPageRoute(
                                TopicPage(
                                  content: appData.searched[index],
                                  index: i,
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
