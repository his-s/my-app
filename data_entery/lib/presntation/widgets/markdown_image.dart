import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';

class MarkdownImage extends StatelessWidget {
  const MarkdownImage(
      {super.key, required this.url, required this.neverScroll});
  final String url;
  final Function(bool value) neverScroll;
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid || Platform.isIOS
        ? PinchZoomReleaseUnzoomWidget(
            twoFingersOn: () => neverScroll(true),
            twoFingersOff: () => Future.delayed(
              PinchZoomReleaseUnzoomWidget.defaultResetDuration,
              () => neverScroll(false),
            ),
            minScale: 1,
            maxScale: 4,
            resetDuration: const Duration(milliseconds: 200),
            boundaryMargin: const EdgeInsets.only(bottom: 0),
            clipBehavior: Clip.none,
            useOverlay: true,
            maxOverlayOpacity: 0.5,
            overlayColor: Colors.black,
            fingersRequiredToPinch: 2,
            child: SizedBox(
              width: 400,
              height: 400,
              child: CachedNetworkImage(
                imageUrl: url,
                filterQuality: FilterQuality.medium,
              ),
            ),
          )
        : CachedNetworkImage(
            imageUrl: url,
            filterQuality: FilterQuality.medium,
          );
  }
}
