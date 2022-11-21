



import 'package:flutter_currency/models/rate_model.dart';

class CurrencyModel {

    late double amount;
    late String base;
    late String date;
    late List<RatesModel> rates;

    CurrencyModel({
        this.amount=0,
        this.base='',
        this.date='',
        this.rates=const [],
    });

    
    //format data from json to currencyModel
    CurrencyModel.fromJson(Map<String, dynamic> json){
        amount= json["amount"]??0.0;
        base= json["base"]??'';
        date=json["date"]??'';
        rates= formatJsonToRate(json["rates"]);
    }
        
    
  //format data from json to ratesModel
  List<RatesModel> formatJsonToRate(Map<String,dynamic>data){
    List<RatesModel> rates=[];
    data.entries.forEach((element) {
      rates.add(RatesModel(name: element.key, value: element.value));
      
    });
    return rates;
  }
    
}
