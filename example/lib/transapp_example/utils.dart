import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

extension ImagePng on ImageUtils {
  static Future<Image> getImage(String path, double width, double height,
      {ColorFilter? colorFilter}) async {
    if (path.endsWith(".png")) {
      final ByteData data = await rootBundle.load(path);
      final Completer<Image> completer = Completer();
      decodeImageFromList(Uint8List.view(data.buffer), (Image img) {
        return completer.complete(img);
      });
      return completer.future;
    } else {
      return ImageUtils.getImageFromSvg(path, width, height, colorFilter: colorFilter);
    }
  }
}