part of mapbox_maps_flutter;

class MapFeature {
  final dynamic id;
  final FeatureGeometry geometry;

  Map<String, dynamic> properties = {};

  MapFeature({required this.id, required this.geometry});

  static MapFeature fromPoint({required dynamic id, required double latitude, required double longitude}) {
    return MapFeature(id: id, geometry: PointGeometry(latitude, longitude));
  }

  static MapFeature fromLineString({required dynamic id, required List<LatLng> coordinates}) {
    return MapFeature(id: id, geometry: LineStringGeometry(coordinates));
  }

  MapFeature addProperty(String key, dynamic value) {
    properties[key] = value;
    return this;
  }

  Map<String, dynamic> toJson() {
    return {
      "type": "Feature",
      "id": id,
      "properties": properties,
      "geometry": geometry.toJson()
    };
  }

}

abstract class FeatureGeometry {
  Map<String, dynamic> toJson();
}

class LineStringGeometry extends FeatureGeometry {
  final List<LatLng> coordinates;

  LineStringGeometry(this.coordinates);


  @override
  Map<String, dynamic> toJson() {
    return {
      "type": "LineString",
      "coordinates": coordinates.map((e) => [e.longitude, e.latitude]).toList()
    };
  }
}

class PointGeometry extends FeatureGeometry {
  final double latitude;
  final double longitude;

  PointGeometry(this.latitude, this.longitude);

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": "Point",
      "coordinates": [longitude, latitude]
    };
  }
}