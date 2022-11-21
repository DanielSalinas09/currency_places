
// To parse this JSON data, do
//
//     final places = placesFromJson(jsonString);
import 'dart:convert';


class Places{

  final List<Place> items=[];

  Places.fromList(List<dynamic>list){
    if(list.isEmpty)return ;
    for (var element in list) {
      final place=Place.fromJson(element);
      items.add(place);
      
    }
    
  }
}


class Place {

    final String xid;
    final String name;
    final double dist;
    final int rate;
    final String osm;
    final String wikidata;
    final String kinds;
    final Point point;

    Place({
        required this.xid,
        required this.name,
        required this.dist,
        required this.rate,
        required this.osm,
        required this.wikidata,
        required this.kinds,
        required this.point,
    });

    

    factory Place.fromJson(Map<String, dynamic> json) => Place(
        xid: json["xid"]??'',
        name: json["name"]??'',
        dist: json["dist"].toDouble()??0.0,
        rate: json["rate"]??0,
        osm: json["osm"] == null ? '' : json["osm"],
        wikidata: json["wikidata"]??'',
        kinds: json["kinds"]??'',
        point: Point.fromJson(json["point"]),
    );

    
}

class Point {

    final double lon;
    final double lat;

    Point({
        required this.lon,
        required this.lat,
    });

    

    factory Point.fromJson(Map<String, dynamic> json) => Point(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
    );

}
