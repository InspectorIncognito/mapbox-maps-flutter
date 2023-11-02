import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageUtils {
  static Future<ui.Image> getImage(String path, double width, double height,
      {ColorFilter? colorFilter}) async {
    if (path.endsWith(".png")) {
      final ByteData data = await rootBundle.load(path);
      final Completer<ui.Image> completer = Completer();
      ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
        return completer.complete(img);
      });
      return completer.future;
    } else {
      String data = await rootBundle.loadString(path);
      DrawableRoot root = await svg.fromSvgString(data, data);
      ui.Picture picture;
      if (colorFilter != null) {
        picture = root.toPicture(
            clipToViewBox: true,
            size: ui.Size(width, height),
            colorFilter: colorFilter);
      } else {
        picture =
            root.toPicture(clipToViewBox: true, size: ui.Size(width, height));
      }
      ui.Image image = await picture.toImage(width.floor(), height.floor());

      return image;
    }
  }
}