import 'package:data_entery/data/data_state_notifier.dart';
import 'package:data_entery/main.dart';
import 'package:data_entery/views/create_data.dart';
import 'package:data_entery/views/topics_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'branch_view.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, customPageRoute(const CreateDataPage()));
        },
        child: const Icon(Icons.create),
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
        title: const Text('QuickToBe'),
        actions: [
          IconButton(
            onPressed: () {
              navigate(const SearchPage(), context);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Consumer(builder: (context, ref, child) {
        final appData = ref.watch(appDataProvider);

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: appData.medicals.length,
                itemBuilder: (context, index) {
                  final title = appData.medicals[index].title;
                  final sections = appData.medicals[index].sections;
                  return ListTile(
                    leading: const Icon(Icons.lock_open),
                    title: Text(title),
                    onTap: () {
                      navigate(
                        BranchsView(title: title, sections: sections),
                        context,
                      );
                    },
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
