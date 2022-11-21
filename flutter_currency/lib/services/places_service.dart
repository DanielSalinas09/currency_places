import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/place_detail.dart';
import '../models/place_modal.dart';


class PlaceService{

  static const urlBase='api.opentripmap.com';
  static const secondbase='/0.1/en/places';
  static const apiKey='5ae2e3f221c38a28845f05b6a575c9d739c06597bedad607b5a0cac6';

  Future<List<Place>>geoName(String name)async{

    final url=Uri.https(urlBase,'$secondbase/geoname',{'apikey':apiKey,'name':name});
    final response=await http.get(url);
    Map<String,dynamic> responseDecode=json.decode(response.body);
    if(responseDecode.isNotEmpty && responseDecode.containsKey('lat') ){
      List places=await getPlace(responseDecode['lat'], responseDecode['lon']);
      if(places.isNotEmpty){
        return Places.fromList(places).items;
      }else{
        return [];
      }
    }else{
      return [];
    }

  }

  Future<List<dynamic>>getPlace(double lat,double lon)async{
    final query={'apikey':apiKey,'radius':'1000','limit':'5','offset':'0','rate':'2','format':'json','lon':'$lon','lat':'$lat'};
     final url=Uri.https(urlBase,'$secondbase/radius',query);
     final response=await http.get(url);
     List<dynamic> responseDecode=json.decode(response.body);

     
     if(responseDecode.isNotEmpty){
      return responseDecode;
     }else{
      return [];
     }
  }


  Future<PlaceDetail> getDetailPlace(String xid)async{
    final url=Uri.https(urlBase,'$secondbase/xid/$xid',{'apikey':apiKey});
    final response=await http.get(url);
    Map<String,dynamic> responseDecode=json.decode(response.body);

    log("Respuesta detail"+responseDecode.toString());
    if(responseDecode.containsKey('xid')){
      return PlaceDetail.fromJson(responseDecode);
    }else{
      return PlaceDetail();
    }

  }

}