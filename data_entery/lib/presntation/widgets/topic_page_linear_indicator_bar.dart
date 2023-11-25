import 'package:flutter/material.dart';

class TopicPageLinearIndicatorBar extends StatelessWidget {
  const TopicPageLinearIndicatorBar({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: _scrollController.hasClients
          ? _scrollController.offset /
              _scrollController.position.maxScrollExtent
          : 0.0,
      backgroundColor: Colors.grey[200],
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
    );
  }
}
