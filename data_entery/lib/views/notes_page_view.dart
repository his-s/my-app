import 'dart:developer';

import 'package:data_entery/data/data_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preview_page.dart';

class NotesPageView extends StatefulWidget {
  const NotesPageView({super.key, required this.id, required this.title});

  final String id;
  final String title;
  @override
  State<NotesPageView> createState() => _NotesPageViewState();
}

class _NotesPageViewState extends State<NotesPageView> {
  final _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
        title: Text('${widget.title} Notes Editor'),
        actions: const [],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          editorBar(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                setState(() {});
              },
              controller: _textEditingController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your markdown here...',
              ),
            ),
          ),
          MarkdownBody(
            data: _textEditingController.text,
          ),
        ],
      ),
    );
  }

  SizedBox editorBar() {
    return SizedBox(
      height: 90,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.format_bold),
            onPressed: () => _insertText('**text**'),
          ),
          IconButton(
            icon: const Icon(Icons.format_italic),
            onPressed: () => _insertText('_text_'),
          ),
          IconButton(
            icon: const Icon(Icons.link),
            onPressed: () => _insertText('[link](url)'),
          ),
          IconButton(
            icon: const Icon(Icons.format_quote),
            onPressed: () => _insertText('>'),
          ),
          IconButton(
            icon: const Icon(Icons.format_list_numbered),
            onPressed: () => _insertText('1.'),
          ),
          IconButton(
            icon: const Icon(Icons.format_list_bulleted),
            onPressed: () => _insertText('-'),
          ),
          IconButton(
            icon: const Icon(Icons.format_strikethrough),
            onPressed: () => _insertText('~~text~~'),
          ),
          IconButton(
            icon: const Icon(Icons.table_chart),
            onPressed: () => _insertText(
              '''| Syntax | Description |
| ----------- | ----------- |
| Header | Title |
| Paragraph | Text |''',
            ),
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {});
              _textEditingController.clear();
            },
          ),
          Consumer(builder: (context, ref, child) {
            final appData = ref.watch(appDataProvider);
            return IconButton(
              icon: const Icon(Icons.save_alt),
              onPressed: () {
                // final data = medicals.map((e) => e.toJson()).toList();
                // log(data.toString());
              },
            );
          }),
        ],
      ),
    );
  }

  void _insertText(String text) {
    final currentText = _textEditingController.text;
    final selection = _textEditingController.selection;
    final newText =
        '${currentText.substring(0, selection.start)}$text${currentText.substring(selection.end)}';

    _textEditingController.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selection.end + text.length),
    );
  }
}
