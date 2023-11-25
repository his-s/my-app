import 'dart:io';
import 'package:data_entery/core/uitls.dart';
import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/presntation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'pages.dart';

class TopicSectionView extends StatefulWidget {
  const TopicSectionView(
      {super.key,
      required this.title,
      required this.medicalSection,
      required this.content});
  final String title;
  final Subsection medicalSection;
  final Section content;

  @override
  State<TopicSectionView> createState() => _TopicSectionViewState();
}

class _TopicSectionViewState extends State<TopicSectionView> {
  late final ScrollController _scrollController;
  bool _blockScroll = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: _blockScroll
            ? const NeverScrollableScrollPhysics()
            : const ScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  customPageRoute(
                    TopicPage(content: widget.content),
                  ),
                );
              },
              icon: Icon(
                Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    customPageRoute(
                      const HomePage(),
                    ),
                  );
                },
                icon: const Icon(Icons.home_outlined),
              ),
            ],
            title: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
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
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopicBarSectionHeader(medicalSection: widget.medicalSection),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MarkdownB(
                      medicalSection: widget.medicalSection,
                      blockScroll: (value) {
                        setState(() {
                          _blockScroll = value;
                        });
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
