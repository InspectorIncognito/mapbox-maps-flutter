// This file is generated.
part of mapbox_maps_flutter;

class FeatureSource extends Source {
  FeatureSource({
    required id,
    List<MapFeature>? collection,
  }) : super(id: id) {
    _collection = collection;
  }

  @override
  String getType() => "geojson";

  List<MapFeature>? _collection;

  /// A URL to a GeoJSON file, or inline GeoJSON.
  Future<String?> get data async {
    return _style?.getStyleSourceProperty(id, "data").then((value) {
      if (value.value != '<null>') {
        return value.value;
      } else {
        return null;
      }
    });
  }

  Future<void>? updateGeoJSON(List<MapFeature> collection) async {
    _collection = collection;
    return _style?.setStyleSourceProperty(id, "data", jsonEncode({
      "type": "FeatureCollection",
      "features": collection.map((e) => e.toJson()).toList()
    }));
  }

  @override
  String _encode(bool volatile) {
    var properties = <String, dynamic>{};

    if (volatile) {

    } else {
      properties["id"] = id;
      properties["type"] = getType();
      if (_collection != null) {
        properties["data"] = jsonEncode({
          "type": "FeatureCollection",
          "features": _collection!.map((e) => e.toJson()).toList()
        });
      }
    }

    return json.encode(properties);
  }
}

// End of generated file.
