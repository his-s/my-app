import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:data_entery/data/models/articles_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class SectionListWidget extends StatefulWidget {
  const SectionListWidget({
    super.key,
    required this.articalId,
    required this.catId,
    required this.sectionId,
    required this.addSupps,
  });
  final String articalId;
  final String catId;
  final String sectionId;
  final Function(List<Subsection> subs) addSupps;
  @override
  State createState() => _SectionListWidgetState();
}

class _SectionListWidgetState extends State<SectionListWidget> {
  List<Subsection> sections = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: sections.length + 1,
            itemBuilder: (context, index) {
              if (index == sections.length) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Ionicons.add),
                    label: const Text("Add Section"),
                    onPressed: () {
                      setState(() {
                        sections.add(
                          Subsection(
                            articleId: widget.articalId,
                            title: '',
                            data: '',
                            orderId: index,
                            id: const Uuid().v4(),
                            createdAt: DateTime.now(),
                            categoryId: widget.catId,
                            sectionId: widget.sectionId,
                          ),
                        );
                      });
                    },
                  ),
                );
              } else {
                return done(index);
              }
            },
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              widget.addSupps(sections);
            });
          },
          child: const Text("Save Sections"),
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
}

Future<void> saveAsJson(
  Section section,
) async {
  final topicData = section.toMap();

  // Convert the data to a JSON string
  String jsonData = json.encode(topicData);

  // Save the JSON data to a file or use it as needed
  // print(jsonData);
  // Get the desktop directory path

  Directory? directory = await getDownloadsDirectory();

  if (await directory?.exists() == false) return;
  // Create a file object with the desktop path
  File file = File('${directory!.path}/${section.title}.json');

  // Write the JSON data to the file
  await file.writeAsString(jsonData);

  // Read the JSON data from the file
  // String fileData = await file.readAsString();

  // Decode the JSON data to a map
  // Map<String, dynamic> fileMap = jsonDecode(fileData);

  // Print the data
  // print(fileMap);
}

class CreateDataPage extends ConsumerStatefulWidget {
  const CreateDataPage(this.sections, {super.key});
  final List<Section> sections;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateDataPageState();
}

class _CreateDataPageState extends ConsumerState<CreateDataPage> {
  final TextEditingController _topicTitle = TextEditingController();
  List<Subsection> supps = [];
  Section topic = Section(
    id: const Uuid().v4(),
    createdAt: DateTime.now(),
    title: '',
    orderId: 0,
    categoryId: '',
    premium: false,
    subsections: [],
    articleId: '',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _topicTitle
                    ..value = TextEditingValue(text: topic.title),
                  decoration: const InputDecoration(
                    hintText: 'Topic Title',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    topic.title = _topicTitle.text.trim();
                    topic.articleId = widget.sections.first.articleId;
                    topic.categoryId = widget.sections.first.categoryId;
                    topic.orderId = widget.sections.length + 1;
                  });
                },
                child: const Text('Save Topic Title'),
              ),
              Column(
                children: [
                  const Text('Is Premium'),
                  Switch(
                    value: topic.premium,
                    onChanged: (value) {
                      setState(() {
                        topic.premium = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: SectionListWidget(
                articalId: widget.sections.first.articleId,
                catId: widget.sections.first.categoryId,
                sectionId: topic.id,
                addSupps: (value) {
                  log(value.toString());
                  setState(() {
                    topic.subsections = value;
                  });
                }),
          ),
          TextButton(
            onPressed: () async {
              saveAsJson(topic);
              // ref.watch(appDataProvider).uplode(topic);
            },
            child: const Text('Save Topic'),
          ),
        ],
      ),
    );
  }
}
