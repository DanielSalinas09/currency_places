// To parse this JSON data, do
//
//     final placeDetail = placeDetailFromJson(jsonString);

import 'dart:convert';

class PlaceDetail {
    PlaceDetail({
        this.xid='',
        this.name='',
        this.address=const {},
        this.rate='',
        this.osm='',
        this.bbox=const {},
        this.wikidata='',
        this.kinds='',
        this.sources=const {},
        this.otm='',
        this.wikipedia='',
        this.image='',
        this.preview=const {},
        this.wikipediaExtracts=const {},
        this.point=const {},
    });

    final String xid;
    final String name;
    final Map<String,dynamic> address;
    final String rate;
    final String osm;
    final Map<String,dynamic> bbox;
    final String wikidata;
    final String kinds;
    final Map<String,dynamic> sources;
    final String otm;
    final String wikipedia;
    final String image;
    final Map<String,dynamic> preview;
    final Map<String,dynamic> wikipediaExtracts;
    final Map<String,dynamic> point;

    factory PlaceDetail.fromRawJson(String str) => PlaceDetail.fromJson(json.decode(str));


    factory PlaceDetail.fromJson(Map<String, dynamic> json) => PlaceDetail(
        xid: json["xid"],
        name: json["name"]??'',
        address: json["address"]??{},
        rate: json["rate"]??'',
        osm: json["osm"]??'',
        bbox: json["bbox"]??{},
        wikidata: json["wikidata"]??'',
        kinds: json["kinds"]??'',
        sources: json["sources"]??{},
        otm: json["otm"]??'',
        wikipedia: json["wikipedia"]??'',
        image: json["image"]??'',
        preview: json["preview"]??{},
        wikipediaExtracts: json["wikipedia_extracts"]??{},
        point: json["point"]??{},
    );

   
}

