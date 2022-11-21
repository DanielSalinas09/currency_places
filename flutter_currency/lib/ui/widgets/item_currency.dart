import 'package:flutter/material.dart';
import 'package:flutter_currency/models/rate_model.dart';
import 'package:flag/flag.dart';
import 'package:flutter_currency/services/flag_services.dart';
import 'package:flutter_currency/ui/utils/utils.dart';

class ItemCurrency extends StatelessWidget {
  final int index;
  final RatesModel rates;
  const ItemCurrency({super.key,required this.rates,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromRGBO(241, 240, 240, 1),
            
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),

                blurRadius: .5,
                offset: Offset(1, 2), // changes position of shadow
              ),
            ]),
        padding: const EdgeInsets.all(15),
      
      child: Row(
        children: [
          
          SizedBox(
            width: 25,
            child: Text(
              "$index",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600
                ),
              

              ),
          ),
            rates.name=="EUR" || rates.name=="HKD"
            ?Image.asset(
              "assets/${rates.name}.png",
              height: 28,
              width: 35,
              )
            :
            Flag.fromString(flags[rates.name], height: 28, width: 35),
          const SizedBox(width: 8.0,),
          Text(
            rates.name,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600
              ),
            
            ),
          const Spacer(),
          Text(
            "\$ ${rates.value}",
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600
              ),
            )
        ]),
    );
  }
}