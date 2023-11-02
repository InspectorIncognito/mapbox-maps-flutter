import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class LoadingLayer {

  late FeatureSource loadingSource;
  var _loadingCounter = 0;
  Timer? _loadingTimer;
  final MapboxMap controller;
  final String id;

  LoadingLayer(this.controller, {this.id = "stop"}) {
    loadingSource = FeatureSource(id: 'loading-source-$id', collection: []);
  }

  Future<void> init({String? below}) async {
    await controller.style.addSource(loadingSource);
    await controller.style.addLayer(CircleLayer(
      sourceId: loadingSource.id,
      id: "loading-layer-$id",
      circleColor: Colors.green.value,
      circleRadius: 1.0,
      circleOpacity: 0.6,
    ));
    controller.style.setStyleLayerProperty("loading-layer-$id", "circle-radius", '["get", "size"]');
  }

  void startLoad(LatLng center) {
    _loadingCounter = 0;
    _loadingTimer?.cancel();
    var feature = MapFeature.fromPoint(id: "load-pin-$id", latitude: center.latitude, longitude: center.longitude)
        .addProperty("size", 5);

    _loadingTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _loadingCounter += 1;
      int n = (_loadingCounter % 10);
      var radius = (n-(2*(n%5))).abs()*3+18;
      feature.addProperty("size", radius);
      loadingSource.updateGeoJSON([feature]);
      //controller.setFeatureSource(loadingSource);
    });
  }

  bool loading() {
    return _loadingTimer != null;
  }

  void stopLoad() {
    _loadingTimer?.cancel();
    _loadingTimer = null;
    loadingSource.updateGeoJSON([]);
  }
}