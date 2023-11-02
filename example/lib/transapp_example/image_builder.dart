import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_example/transapp_example/utils.dart';
import 'package:mapbox_maps_example/utils.dart';

class PredictionImageBuilder {

  static void rotate(Canvas canvas, double cx, double cy, double angle) {
    canvas.translate(cx, cy);
    canvas.rotate(angle);
    canvas.translate(-cx, -cy);
  }

  static Future<Uint8List?> get({bool pointingRight = true}) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint();
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        maxLines: 2,
        ellipsis: "...",
        textAlign: TextAlign.center
    );

    canvas.save();
    // Draw background
    if (!pointingRight) {
      canvas.translate(SizeUtil.getAxisX(68), 0);
      canvas.scale(-1, 1);
    }
    var asset = "assets/svg/map_bus_det.svg";
    final image = await ImageUtils.getImage(asset, SizeUtil.getAxisX(58), SizeUtil.getAxisY(36));
    canvas.drawImage(image, SizeUtil.convert(const Offset(9, 0)), paint);

    canvas.restore();

    // Draw route code
    textPainter.text = TextSpan(
      text: "506",
      style: TextStyle(
        fontSize: SizeUtil.getAxisBoth(14),
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
    textPainter.layout(minWidth: SizeUtil.getAxisBoth(36), maxWidth: SizeUtil.getAxisBoth(36));
    textPainter.paint(canvas, SizeUtil.convert(Offset(pointingRight ? 14 : 18, 10)));

    final markerImage = await pictureRecorder.endRecording().toImage(SizeUtil.getAxisX(68).floor(), SizeUtil.getAxisY(39).floor());
    final data = await markerImage.toByteData(format: ImageByteFormat.png);
    return data?.buffer.asUint8List();
  }
}