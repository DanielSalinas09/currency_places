

import 'package:flutter/cupertino.dart';
import 'package:flutter_currency/models/currency_model.dart';
import 'package:flutter_currency/services/currency_service.dart';

class CurrencyProvider with ChangeNotifier{


  final currencyService=CurrencyService();

  CurrencyModel _currencys=CurrencyModel();
  String _typeCurrency='USD';

  bool _modeDark=false;

  bool loading=false;
  CurrencyModel get currencys=>_currencys;

  String get typeCurrency=>_typeCurrency;
  bool get modeDark=>_modeDark;


  //provider to get the service data
  void getCurrency(String amount)async{
    

    //validate if the amount is not empty 
    if(amount.isNotEmpty){
      
        loading=true;
        notifyListeners();
        _currencys=await  currencyService.getCurrency(amount, _typeCurrency);
        loading=false;
      
    }else{
      _currencys=CurrencyModel();
    }
    
    notifyListeners();
  }
  //method to select a currency
  void selectTypeCurrency(String value){
    _typeCurrency=value;
    
    notifyListeners();
  }
  //method to change theme
  void isMode(bool mode){
    _modeDark=mode;
    notifyListeners();
  }

}