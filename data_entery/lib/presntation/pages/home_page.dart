import 'package:data_entery/presntation/widgets/home_components/chapters_logo_title.dart';
import 'package:data_entery/presntation/widgets/home_components/home_app_bar.dart';
import 'package:data_entery/presntation/widgets/home_components/home_tiles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

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
        slivers: [const HomeAppBar(), homeTitleImage(), const HomeTiles()],
      ),
    );
  }

  SliverToBoxAdapter homeTitleImage() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: ChaptersLogoTitle(),
      ),
    );
  }
}
