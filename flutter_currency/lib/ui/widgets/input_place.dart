import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_currency/provider/place_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class InputPlaces extends StatelessWidget {
  final TextEditingController textController;
  InputPlaces({Key? key, required this.textController}) : super(key: key);

  Timer? debounce;
  String input = '';
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromRGBO(217, 217, 217, 1),
            border: Border.all(color: Colors.grey),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),

                blurRadius: 1,
                offset: const Offset(1, 3), // changes position of shadow
              ),
            ]),
        padding: const EdgeInsets.all(15),
        child: TextField(
          controller: textController,
          decoration: const InputDecoration.collapsed(
              hintText: 'Region, ciudad, pais, etc...'),
          onChanged: (String? value) {
            if (value!.isNotEmpty) {
              onCurrencyChange(context);
            }
          },
        ));
  }


  //lanzar peticion 700 milisegundos despues de que el usuario deje de escribir
  onCurrencyChange(BuildContext context) {
    
    if (input != textController.text) {
      if (debounce?.isActive ?? false) debounce?.cancel();
      debounce = Timer(const Duration(milliseconds: 700), () {
        input = textController.text;
        context.read<PlacesProvider>().getPlaces(textController.text);
      });
    }
  }
}
