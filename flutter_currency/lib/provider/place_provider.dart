import 'package:flutter/cupertino.dart';
import 'package:flutter_currency/models/place_detail.dart';
import 'package:flutter_currency/services/places_service.dart';

import '../models/place_modal.dart';

class PlacesProvider with ChangeNotifier {
  final placeService = PlaceService();

  List<Place> _places = [];
  PlaceDetail _placeDetail=PlaceDetail();

  bool loading = false;
  bool loadingDetail = false;
  List<Place> get places => _places;
  PlaceDetail get placeDetail => _placeDetail;

  //provider to get the service data
  void getPlaces(String name) async {
    if (name.isNotEmpty) {
      loading = true;
      notifyListeners();
      final response = await placeService.geoName(name);
      _places = response;
      loading=false;
      notifyListeners();
    } else {
      _places = [];
      loading = false;
      notifyListeners();
    }
    
  }

  void getDetail(String xid)async{
    if(xid.isNotEmpty){
      loadingDetail=true;
      notifyListeners();
      final response = await placeService.getDetailPlace(xid);
      _placeDetail=response;
      loadingDetail=false;
      notifyListeners();

    }else{
      _placeDetail=PlaceDetail();
      loadingDetail = false;
      notifyListeners();
    }
  }
}
