import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/presntation/widgets/widgets.dart';
import 'package:data_entery/providers/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key, required this.content, this.index = 0});
  final int index;
  final Section content;

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
          : null,
      body: CustomScrollView(
        controller: _scrollController,
        physics: _blockScroll
            ? const NeverScrollableScrollPhysics()
            : const ScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              widget.content.title,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
            actions: const [
              GoHomeButton(),
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
          Consumer(
            builder: (_, WidgetRef ref, __) {
              final subsections = sortSubsections(widget.content.subsections);
              return SliverList.builder(
                  itemCount: subsections.length,
                  itemBuilder: (context, index) {
                    final subsection = subsections[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopicBarSectionHeader(medicalSection: subsection),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: MarkdownB(
                            medicalSection: subsection,
                            blockScroll: (value) {
                              setState(() {
                                _blockScroll = value;
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}

List<Subsection> sortSubsections(List<Subsection> subsections) {
  subsections.sort((a, b) => a.orderId.compareTo(b.orderId));
  return subsections;
}
