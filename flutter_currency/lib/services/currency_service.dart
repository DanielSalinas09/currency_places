import 'dart:convert';


import 'package:flutter_currency/models/currency_model.dart';
import 'package:http/http.dart' as http;

class CurrencyService{


  //service to make requests with currencies
  Future<CurrencyModel>getCurrency(String amount,String typeCurrency )async{

    final url=Uri.https('api.frankfurter.app', '/latest',{'from':typeCurrency,'amount':amount});
    final response= await http.get(url);
    //decode response
    final decode=jsonDecode(response.body);
    //convert the response to a currency class
    return CurrencyModel.fromJson(decode);
  }

  

}