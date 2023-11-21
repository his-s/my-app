import 'dart:convert';
import 'dart:io';

import 'package:data_entery/models/medical_content.dart';
import 'package:data_entery/models/medical_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:path_provider/path_provider.dart';

class CreateDataPage extends StatefulWidget {
  const CreateDataPage({super.key});

  @override
  State createState() => _CreateDataPageState();
}

class _CreateDataPageState extends State<CreateDataPage> {
  late final TextEditingController topicController;
  late final TextEditingController sectionTitleController;
  late final TextEditingController sectionDataController;
  List<MedicalSection> sections = [];
  @override
  void initState() {
    super.initState();
    topicController = TextEditingController();
    sectionDataController = TextEditingController();
    sectionTitleController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    // topicController.dispose();
    // sectionDataController.dispose();
    // sectionDataController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Topic',
          style: TextStyle(color: Colors.black87),
        ),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: topicController,
                    decoration: const InputDecoration(labelText: 'Topic Title'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save data to JSON file
                    setState(() {});
                  },
                  child: const Text('Save Title'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
                child: SectionListWidget(
              title: topicController.text,
            )),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class SectionListWidget extends StatefulWidget {
  const SectionListWidget({super.key, required this.title});
  final String title;
  @override
  State createState() => _SectionListWidgetState();
}

class _SectionListWidgetState extends State<SectionListWidget> {
  List<MedicalSection> sections = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: sections.length + 1,
            itemBuilder: (context, index) {
              if (index == sections.length) {
                return newMethod();
              } else {
                return done(index);
              }
            },
          ),
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return ElevatedButton(
              onPressed: () async {
                await saveAsJson(sections, widget.title);
              },
              child: const Text('Done'),
            );
          },
        ),
      ],
    );
  }

  Row done(int index) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Section Title'),
                onChanged: (value) {
                  setState(() {
                    sections[index].title = value;
                  });
                },
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                decoration:
                    const InputDecoration(labelText: 'Section Description'),
                onChanged: (value) {
                  setState(() {
                    sections[index].data = value;
                  });
                },
              ),
            ]),
          ),
        ),
        IconButton(
          onPressed: () {
            sections.removeAt(index);
            setState(() {});
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }

  Padding newMethod() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        icon: const Icon(Ionicons.add),
        label: const Text("Add Section"),
        onPressed: () {
          setState(() {
            sections.add(MedicalSection(
              title: '',
              data: '',
            ));
          });
        },
      ),
    );
  }
}

Future<void> saveAsJson(
  List<MedicalSection> sections,
  String title,
) async {
  final topicData = MedicalContent(title: title, sections: sections).toMap();

  // Convert the data to a JSON string
  String jsonData = json.encode(topicData);

  // Save the JSON data to a file or use it as needed
  print(jsonData);
  // Get the desktop directory path

  Directory? directory = await getDownloadsDirectory();

  if (await directory?.exists() == false) return;
  // Create a file object with the desktop path
  File file = File('${directory!.path}/$title.json');

  // Write the JSON data to the file
  await file.writeAsString(jsonData);

  // Read the JSON data from the file
  String fileData = await file.readAsString();

  // Decode the JSON data to a map
  Map<String, dynamic> fileMap = jsonDecode(fileData);

  // Print the data
  print(fileMap);
}
