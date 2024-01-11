part of mapbox_maps_flutter;

class ImageUtils {
  static Future<ui.Image> getImageFromSvg(String path, double width, double height,
      {ColorFilter? colorFilter}) async {
    String data = await rootBundle.loadString(path);

    final SvgStringLoader svgStringLoader = SvgStringLoader(data);
    final PictureInfo pictureInfo = await vg.loadPicture(svgStringLoader, null);
    final ui.Picture picture = pictureInfo.picture;
    ui.PictureRecorder recorder = ui.PictureRecorder();
    ui.Canvas canvas = Canvas(recorder, Rect.fromPoints(Offset.zero, Offset(width, height)));
    canvas.scale(width / pictureInfo.size.width, height / pictureInfo.size.height);
    canvas.drawPicture(picture);
    final ui.Image imgByteData = await recorder.endRecording().toImage(width.ceil(), height.ceil());
    pictureInfo.picture.dispose();

    if (colorFilter == null) {
      return imgByteData;
    }

    recorder = ui.PictureRecorder();
    canvas = Canvas(recorder, Rect.fromPoints(Offset.zero, Offset(width, height)));
    Paint paint = new Paint();
    paint.colorFilter = colorFilter;

    ui.Size inputSize = ui.Size(imgByteData.width.toDouble(), imgByteData.height.toDouble());
    final FittedSizes fittedSizes =
    applyBoxFit(BoxFit.contain, inputSize, inputSize);
    final ui.Size sourceSize = fittedSizes.source;
    final Rect sourceRect = Alignment.center.inscribe(sourceSize, Offset.zero & inputSize);
    var rect = Rect.fromPoints(Offset(0.0, 0.0),
        Offset(imgByteData.width.toDouble(), imgByteData.height.toDouble()));

    canvas.drawImageRect(imgByteData, sourceRect, rect, paint);
    final ui.Image image = await recorder.endRecording().toImage(width.ceil(), height.ceil());
    return image;
  }
}