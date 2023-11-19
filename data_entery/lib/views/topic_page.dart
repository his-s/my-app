import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_entery/views/custom_scaffold_page.dart';
import 'package:data_entery/widgets/expanded_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/model.dart';
import 'notes_page_view.dart';
import 'topics_view.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key, required this.content, this.index = 0});
  final int index;
  final MedicalContent content;

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  late ScrollController _scrollController;
  late List<GlobalKey> keys;
  bool _showFab = false;
  @override
  void initState() {
    super.initState();
    // keys =
    //     List.generate(widget.content.sections.length, (index) => GlobalKey());
    _scrollController = ScrollController();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _scrollController.jumpTo((widget.index.toDouble() + 1) * 400);
    //   log("${widget.index}from topic page");
    //   scrollTo50(widget.index);
    // });
    _scrollController.addListener(() {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent / 10) {
        setState(() {
          _showFab = true;
        });
      } else {
        setState(() {
          _showFab = false;
        });
      }
    });
  }

  scrollTo50(int index) {
    print(keys.length);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This callback will be called after the frame has been built
      RenderBox? renderBox =
          keys[index].currentContext?.findRenderObject() as RenderBox?;

      if (renderBox != null) {
        // Get the position of the target widget
        double offset = renderBox.localToGlobal(Offset.zero).dy;

        // Jump to the position of the target widget
        _scrollController.jumpTo(offset);
      }
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _showFab
          ? FloatingActionButton.small(
              onPressed: _scrollToTop,
              child: const Icon(
                Icons.arrow_upward,
                size: 15,
              ),
            )
          : FloatingActionButton.small(
              onPressed: () {
                Navigator.push(
                  context,
                  customPageRoute(NotesPageView(
                    title: widget.toString().title(),
                    id: widget.toString().title(),
                  )),
                );
              },
              child: const Icon(
                Icons.create,
                size: 15,
              ),
            ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: Text(
              widget.content.title,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
            pinned: true,
            bottom: PreferredSize(
              preferredSize: const Size(400, 0),
              child: LinearProgressIndicator(
                value: _scrollController.hasClients
                    ? _scrollController.offset /
                        _scrollController.position.maxScrollExtent
                    : 0.0,
                backgroundColor: Colors.grey[200],
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
              ),
            ),
          ),
          SliverList.builder(
              itemCount: widget.content.sections.length,
              itemBuilder: (context, index) {
                final medicalSection = widget.content.sections[index];
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 40,
                        alignment: Alignment.centerLeft,
                        color: Colors.indigo,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          medicalSection.title.title(),
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: MarkdownB(medicalSection: medicalSection),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
