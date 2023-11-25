// import 'package:data_entery/main.dart';
// import 'package:data_entery/views/create_data.dart';
// import 'package:data_entery/views/notes_page_view.dart';
// import 'package:data_entery/views/preview_page.dart';
// import 'package:data_entery/views/topics_view.dart';
// import 'package:flutter/material.dart';

// import 'home_page.dart';

// extension Title on String {
//   String title() {
//     return substring(0, 1).toUpperCase() +
//         substring(
//           1,
//         );
//   }
// }

// class CustomScaffold<T> extends StatefulWidget {
//   const CustomScaffold({
//     super.key,
//     required this.data,
//     required this.children,
//     required this.scrollController,
//     required this.sliverList,
//   });

//   final T data;
//   final List<Widget> children;
//   final ScrollController scrollController;
//   final SliverList sliverList;
//   @override
//   State<CustomScaffold> createState() => _CustomScaffoldState();
// }

// class _CustomScaffoldState extends State<CustomScaffold> {
//   // final GlobalKey _examinationKey = GlobalKey();
//   bool _showFab = false;
//   @override
//   void initState() {
//     super.initState();
//   }

//   void _scrollToTop() {
//     widget.scrollController.animateTo(
//       0,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<dynamic> titles = widget.data.sections
//         .map(
//           (e) => e.title,
//         )
//         .toList();
//     return Scaffold(
//       floatingActionButton: _showFab
//           ? FloatingActionButton.small(
//               onPressed: _scrollToTop,
//               child: const Icon(
//                 Icons.arrow_upward,
//                 size: 15,
//               ),
//             )
//           : FloatingActionButton.small(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   customPageRoute(NotesPageView(
//                     title: widget.data.title.toString().title(),
//                     id: widget.data.title.toString().title(),
//                   )),
//                 );
//               },
//               child: const Icon(
//                 Icons.create,
//                 size: 15,
//               ),
//             ),
//       body: CustomScrollView(slivers: [
//         // int visibleItemIndex =
//         //     (_scrollController.offset / 50).round(); // Adjust as needed
//         // String title =
//         //     visibleItemIndex < titles.length ? titles[visibleItemIndex] : '';

//         SliverAppBar(
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                     context, customPageRoute(const MyApp()));
//               },
//               icon: const Icon(Icons.home),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//           ],
//           leading: IconButton(
//             icon: const Icon(Icons.chevron_left), // Use the chevron left icon
//             onPressed: () {
//               Navigator.of(context).pop(); // Add your pop logic here
//             },
//           ),
//           floating: true,
//           pinned: true,
//           title: Text(widget.data.title.toString().title()),
//         ),
//         SliverPersistentHeader(
//           pinned: true,
//           delegate: MySliverPersistentHeaderDelegate(
//             LinearProgressIndicator(
//               value: widget.scrollController.hasClients
//                   ? widget.scrollController.offset /
//                       widget.scrollController.position.maxScrollExtent
//                   : 0.0,
//               backgroundColor: Colors.grey[200],
//               valueColor:
//                   const AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
//             ),
//           ),
//         ),

//         widget.sliverList,
//       ]),
//     );
//   }
// }
