import 'package:flutter/material.dart';

import '../models/model.dart';
import 'topics_view.dart';

class BranchsView extends StatelessWidget {
  const BranchsView({
    super.key,
    required this.title,
    required this.sections,
  });

  final String title;
  final List<MedicalBranch> sections;

  @override
  Widget build(BuildContext context) {
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
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, index) {
            final branchtitle = sections[index].title;
            final branchSections = sections[index].sections;
            return ListTile(
              title: Text(branchtitle),
              leading: const Icon(
                Icons.vaccines,
                color: Colors.black54,
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   customPageRoute(
                //   //   // TopicsView(
                //   //   //   title: branchtitle,
                //   //   //   sections: branchSections,
                //   //   // ),
                //   // ),
                // );
              },
            );
          }),
    );
  }
}
