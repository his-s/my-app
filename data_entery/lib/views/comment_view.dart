// class TopicPage extends StatefulWidget {
//   const TopicPage({
//     super.key,
//     required this.medicalContent,
//   });

//   final MedicalContent medicalContent;

//   @override
//   State<TopicPage> createState() => _TopicPageState();
// }

// class _TopicPageState extends State<TopicPage> {
//   final ScrollController _scrollController = ScrollController();
//   final GlobalKey _examinationKey = GlobalKey();
//   bool _showFab = false;
//   @override
//   void initState() {
//     super.initState();

//     _scrollController.addListener(() {
//       if (_scrollController.offset >=
//           _scrollController.position.maxScrollExtent / 2) {
//         setState(() {
//           _showFab = true;
//         });
//       } else {
//         setState(() {
//           _showFab = false;
//         });
//       }
//     });
//   }

//   void _scrollToTop() {
//     _scrollController.animateTo(
//       0,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<String> titles = widget.medicalContent.sections
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
//           : null,
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           // int visibleItemIndex =
//           //     (_scrollController.offset / 50).round(); // Adjust as needed
//           // String title =
//           //     visibleItemIndex < titles.length ? titles[visibleItemIndex] : '';
//           return [
//             SliverAppBar(
//               backgroundColor: Colors.indigoAccent,
//               foregroundColor: Colors.white,
//               floating: true,
//               pinned: true,
//               title: Text(widget.medicalContent.title),
//             ),
//             SliverToBoxAdapter(
//               child: Container(
//                 // padding: const EdgeInsets.all(16.0),
//                 child: LinearProgressIndicator(
//                   value: _scrollController.hasClients
//                       ? _scrollController.offset /
//                           _scrollController.position.maxScrollExtent
//                       : 0.0,
//                   backgroundColor: Colors.grey[200],
//                   valueColor: const AlwaysStoppedAnimation<Color>(
//                       Colors.lightBlueAccent),
//                 ),
//               ),
//             ),
//             // SliverAppBar(
//             //   title: Text(title),
//             // ),
//           ];
//         },
//         body: ListView(
//           controller: _scrollController,
//           children: List.generate(
//             widget.medicalContent.sections.length,
//             (index) {
//               final sections = widget.medicalContent.sections[index];
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ExpansionTile(
//                   key: titles[index] == "Examination" ? _examinationKey : null,
//                   initiallyExpanded: true,
//                   tilePadding: const EdgeInsets.all(0),
//                   leading: VerticalDivider(
//                     thickness: 5.5,
//                     color: Colors.blue.shade300,
//                   ),
//                   maintainState: true,
//                   backgroundColor: Colors.transparent,
//                   collapsedBackgroundColor: Colors.transparent,
//                   iconColor: Colors.blue.shade300,
//                   collapsedIconColor: Colors.blue.shade400,
//                   textColor: Colors.black,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(0),
//                     ),
//                   ),
//                   collapsedShape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(0),
//                     ),
//                   ),
//                   expandedCrossAxisAlignment: CrossAxisAlignment.start,
//                   expandedAlignment: Alignment.centerLeft,
//                   childrenPadding: const EdgeInsets.all(10),
//                   title: Text(sections.title),
//                   children: [
//                     MarkdownBody(
//                       selectable: true,
//                       styleSheet: MarkdownStyleSheet(
//                         h3: GoogleFonts.roboto(),
//                         h2: GoogleFonts.roboto(),
//                         h1: GoogleFonts.roboto(),
//                         p: GoogleFonts.roboto(),
//                       ),
//                       data: sections.data,
//                       imageBuilder: (uri, title, alt) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: SizedBox(
//                             width: 250,
//                             height: 250,
//                             child: CachedNetworkImage(
//                               imageUrl: uri.toString(),
//                             ),
//                           ),
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class BoldTextParser extends StatelessWidget {
  final String data;

  const BoldTextParser(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: parseBoldText(data),
        style: DefaultTextStyle.of(context).style,
      ),
    );
  }

  List<TextSpan> parseBoldText(String input) {
    List<TextSpan> spans = [];
    // Look for patterns like **text**
    input.splitMapJoin(
      RegExp(
          r'(\*\*|_)(.*?)(\*\*|_)|#\s(.*?)(?:\n|$)'), // Updated regex for bold, italic, and headings
      onMatch: (Match match) {
        if (match.group(1) != null && match.group(3) != null) {
          // Bold
          spans.add(TextSpan(
            text: match.group(2),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ));
        } else if (match.group(1) != null || match.group(3) != null) {
          // Italic
          spans.add(TextSpan(
            text: match.group(2),
            style: const TextStyle(fontStyle: FontStyle.italic),
          ));
        } else if (match.group(4) != null) {
          // Heading
          String? headingText = match.group(4);
          int headingLevel = match.end - match.start - 1;

          spans.add(TextSpan(
            text: headingText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: headingLevel == 2
                  ? 18
                  : headingLevel == 3
                      ? 16
                      : 14,
            ),
          ));
        }

        return '';
      },
      onNonMatch: (String nonMatch) {
        spans.add(
          TextSpan(text: nonMatch),
        );
        return '';
      },
    );
    return spans;
  }
}
