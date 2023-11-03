import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mapbox_maps_example/transapp_example/extensions.dart';
import 'package:mapbox_maps_example/transapp_example/image_builder.dart';
import 'package:mapbox_maps_example/transapp_example/loading_layer.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:turf/turf.dart' as turf;

import '../main.dart';
import '../page.dart';
import '../utils.dart';

class TransappPage extends ExamplePage {
  TransappPage() : super(const Icon(Icons.adb), 'Transapp');

  @override
  Widget build(BuildContext context) {
    return const TransappWidget();
  }
}

class TransappWidget extends StatefulWidget {
  const TransappWidget();

  @override
  State createState() => TransappWidgetState();
}

class TransappWidgetState extends State<TransappWidget> {
  MapboxMap? mapboxMap;
  var isLight = true;

  final defaultEdgeInsets = MbxEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);

  void _onMapIdle(MapIdleEventData mapIdleEventData) {

  }

  _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;

    var collection =  [
      MapFeature.fromPoint(id: "stop-1", latitude: -33.452585034903954, longitude: -70.57163721695412)
          .addProperty("image-name", "bus").addProperty("selected", false).addProperty("mode", 1),
      MapFeature.fromPoint(id: "stop-2", latitude: -33.45273711877396, longitude: -70.5709891098905)
          .addProperty("image-name", "stop").addProperty("selected", false).addProperty("mode", 1),
      MapFeature.fromPoint(id: "stop-3", latitude: -33.45362426936657, longitude: -70.57124227671223)
          .addProperty("image-name", "metro").addProperty("selected", false).addProperty("mode", 3),
    ];

    var source = FeatureSource(id: "stops-source", collection: collection);
    await mapboxMap.style.addSource(source);

    await mapboxMap.style.addSvgImage(
      "stop",
      "assets/svg/map_bus_stop.svg",
      SizeUtil.getAxisX(22),
      SizeUtil.getAxisY(34),
      SizeUtil.devicePixelRatio,
    );
    await mapboxMap.style.addSvgImage(
      "metro",
      "assets/svg/map_metro_station.svg",
      SizeUtil.getAxisX(30),
      SizeUtil.getAxisY(33),
      SizeUtil.devicePixelRatio,
    );

    await mapboxMap.style.addSvgImage(
      "icon",
      "assets/svg/map_metro_station.svg",
      SizeUtil.getAxisX(30),
      SizeUtil.getAxisY(33),
      SizeUtil.devicePixelRatio,
    );

    var rightImage = await PredictionImageBuilder.get();
    await mapboxMap.style.addImage(
      "bus",
      MbxImage(width: SizeUtil.getAxisX(68).floor(), height: SizeUtil.getAxisY(39).floor(), data: rightImage!),
      SizeUtil.devicePixelRatio,
    );

    /*source.updateGeoJSON([
      MapFeature.fromPoint(id: "stop-1", latitude: -33.452585034903954, longitude: -70.57163721695412).addProperty("image-name", "stop"),
      MapFeature.fromPoint(id: "stop-2", latitude: -33.45273711877396, longitude: -70.5709891098905).addProperty("image-name", "metro"),
      MapFeature.fromPoint(id: "stop-3", latitude: -33.45362426936657, longitude: -70.57124227671223).addProperty("image-name", "metro"),
    ]);*/

    await mapboxMap.style.addLayer(
      SymbolLayer(
        id: "metro-layer",
        sourceId: "stops-source",
        iconImage: "{image-name}",
        iconAllowOverlap: true,
        filter: [Expressions.all,
          [Expressions.equal, [Expressions.get, "selected"], [Expressions.literal, false]],
          [Expressions.equal, [Expressions.get, "mode"], [Expressions.literal, 1]],
        ],
        minZoom: 15,
      ),
    );

    await mapboxMap.style.addLayer(
      SymbolLayer(
        id: "stops-layer",
        sourceId: "stops-source",
        iconImage: "{image-name}",
        iconAllowOverlap: true,
        filter: [Expressions.all,
          [Expressions.equal, [Expressions.get, "selected"], [Expressions.literal, false]],
          [Expressions.equal, [Expressions.get, "mode"], [Expressions.literal, 3]],
        ],
        minZoom: 13,
      ),
    );

    var loadingLayer = LoadingLayer(mapboxMap, id: "example");
    loadingLayer.init();

    GeoJsonSource lineSource = GeoJsonSource(id: 'arrival-line-source', data: json.encode(FeatureCollection()));
    LineLayer lineLayer = LineLayer(
      id: 'arrival-line-layer',
      sourceId: lineSource.id,
      lineCap: LineCap.ROUND,
      lineJoin: LineJoin.ROUND,
      lineWidth: 4.0,
      lineOpacity: 1.0,
    );
    await mapboxMap.style.addSource(lineSource);
    await mapboxMap.style.addLayer(lineLayer);


    mapboxMap.setOnMapTapListener((coordinate) async {
      loadingLayer.stopLoad();
      loadingLayer.startLoad(LatLng(coordinate.x, coordinate.y));
      final ScreenCoordinate conv = await mapboxMap.pixelForCoordinate(
        turf.Point(coordinates: turf.Position(coordinate.y, coordinate.x,),).toJson(),
      );

      var tapQuery = RenderedQueryGeometry(
          value: json.encode(conv.encode()), type: Type.SCREEN_COORDINATE
      );
      var query = await mapboxMap.queryRenderedFeatures(tapQuery, RenderedQueryOptions(layerIds: ["stops-layer", "metro-layer"], filter: null));

      var queryRes = query.firstWhere((element) {
        return true;
      }, orElse: () => null);
      if (queryRes != null) {
        print("click: ${queryRes.feature["id"]}");
        var feature = collection.firstWhereOrNull((element) => element.id == queryRes.feature["id"]);
        if (feature != null) {
          final line = LineString(coordinates: [
            Position(-70.57149621803848, -33.44801846800802),
            Position(-70.57076665718871, -33.4535327202852),
            Position(-70.56516620478328, -33.45299563320278),
            Position(-70.56437227091465, -33.45707741165431)
          ]);
          await lineSource.updateGeoJSON(json.encode(line));
          await mapboxMap.style.setStyleLayerProperty(lineLayer.id, "line-color", HexColor.fromHex("#521921").value.toRGBA());

          var geometry = feature.geometry as PointGeometry?;
          if (geometry != null) {
            loadingLayer.stopLoad();
            mapboxMap.flyTo(
                CameraOptions(
                  center: Point(coordinates: Position(geometry.longitude, geometry.latitude)).toJson(),
                  padding: MbxEdgeInsets(top: 0, left: 0, bottom: 200.0 * SizeUtil.devicePixelRatio, right: 0),
                  zoom: 16,
                ),
                null);
          }
        }
      } else {
        await lineSource.updateGeoJSON(json.encode(FeatureCollection()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: [
          MapWidget(
            key: ValueKey("mapWidget"),
            resourceOptions: ResourceOptions(accessToken: MapsDemo.ACCESS_TOKEN),
            styleUri: MapboxStyles.MAPBOX_STREETS,
            cameraOptions: CameraOptions(
                center: Point(coordinates: Position(-70.57124227671223, -33.45362426936657)).toJson(),
                zoom: 14.0),
            onMapCreated: _onMapCreated,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.amber,
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}
