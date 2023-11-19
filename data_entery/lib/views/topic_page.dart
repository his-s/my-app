import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_entery/widgets/expanded_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/model.dart';

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
  @override
  void initState() {
    super.initState();
    keys =
        List.generate(widget.content.sections.length, (index) => GlobalKey());
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo((widget.index.toDouble() + 1) * 400);
      log("${widget.index}from topic page");
      scrollTo50(widget.index);
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

  @override
  Widget build(BuildContext context) {
    // return CustomScaffold<MedicalContent>(
    //   scrollController: _scrollController,
    //   data: widget.content,
    //   children: List.generate(
    //     widget.content.sections.length,
    //     (index) {
    //       final sections = widget.content.sections[index];
    //       return tile(sections);
    //     },
    //   ),
    // );
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: widget.content.sections.length,
        itemBuilder: (context, index) {
          final medicalSection = widget.content.sections[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onLongPress: () {
                // log('i');
              },
              child: ExpansionTile(
                key: keys[index],
                initiallyExpanded: true,
                tilePadding: const EdgeInsets.all(0),
                leading: VerticalDivider(
                  thickness: 5.5,
                  color: Colors.blue.shade300,
                ),
                maintainState: true,
                backgroundColor: Colors.transparent,
                collapsedBackgroundColor: Colors.transparent,
                iconColor: Colors.blue.shade300,
                collapsedIconColor: Colors.blue.shade400,
                textColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  ),
                ),
                collapsedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  ),
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.centerLeft,
                childrenPadding: const EdgeInsets.all(10),
                title: Text(medicalSection.title),
                children: [
                  MarkdownBody(
                    selectable: true,
                    styleSheet: MarkdownStyleSheet(
                      h3: GoogleFonts.roboto(),
                      h2: GoogleFonts.roboto(),
                      h1: GoogleFonts.roboto(),
                      p: GoogleFonts.roboto(),
                    ),
                    data: medicalSection.data,
                    imageBuilder: (uri, title, alt) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: CachedNetworkImage(
                            imageUrl: uri.toString(),
                            filterQuality: FilterQuality.medium,
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
