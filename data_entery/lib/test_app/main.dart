import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScrollToIndexListView(),
    );
  }
}

class ScrollToIndexListView extends StatefulWidget {
  const ScrollToIndexListView({super.key});

  @override
  State<ScrollToIndexListView> createState() => _ScrollToIndexListViewState();
}

class _ScrollToIndexListViewState extends State<ScrollToIndexListView> {
  late ScrollController _controller;
  List<GlobalKey> keys = List.generate(250, (index) => GlobalKey());
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      scrollTo50(50);
    });
  }

  scrollTo50(int index) {
    RenderBox renderBox =
        keys[index].currentContext!.findRenderObject() as RenderBox;

    // Get the position of the target widget
    double offset = renderBox.localToGlobal(Offset.zero).dy;

    // Jump to the position of the target widget
    _controller.jumpTo(offset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          controller: _controller,
          itemCount: 250,
          itemBuilder: (context, index) {
            return Text(
              "$index value",
              key: keys[index],
            );
          }),
    );
  }
}
