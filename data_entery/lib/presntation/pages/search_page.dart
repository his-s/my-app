import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/models/user_model.dart';

import 'package:data_entery/presntation/widgets/widgets.dart';
import 'package:data_entery/providers/app_data_provider.dart';
import 'package:data_entery/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final appData = ref.watch(appDataProvider.notifier);
    appData.updateSearch(query);
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
              style: GoogleFonts.roboto(),
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
          Consumer(
            builder: (_, WidgetRef ref, __) {
              final appUser = ref.watch(userStateProvider);
              return Expanded(
                child: ListView.builder(
                  itemCount: appData.searched.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: getListTile(
                        appUser,
                        appData.searched[index],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget getListTile(
  AppUser user,
  Section sec,
) {
  if (user.premium) {
    return SearchNormalListWidget(
      searched: sec,
    );
  } else {
    if (sec.premium) {
      return SearchPremiumListWidget(
        searched: sec,
      );
    } else {
      return SearchNormalListWidget(
        searched: sec,
      );
    }
  }
}
