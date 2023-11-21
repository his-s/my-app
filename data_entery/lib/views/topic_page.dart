import 'package:data_entery/views/custom_scaffold_page.dart';
import 'package:data_entery/views/home_page.dart';
import 'package:data_entery/widgets/expanded_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sticky_headers/sticky_headers.dart';
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
  bool _blockScroll = false;
  bool _showFab = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
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

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
        physics: _blockScroll
            ? const NeverScrollableScrollPhysics()
            : const ScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              widget.content.title.title(),
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, customPageRoute(const HomePage()));
                },
                icon: const Icon(Icons.home_outlined),
              ),
            ],
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
                        child: MarkdownB(
                          medicalSection: medicalSection,
                          blockScroll: (value) {
                            setState(() {
                              _blockScroll = value;
                            });
                          },
                        ),
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
