import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_currency/provider/currency_provider.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class InputCurrency extends StatelessWidget {
  final TextEditingController textController;
  InputCurrency({super.key, required this.textController});

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
          keyboardType: TextInputType.number,
          decoration:
              const InputDecoration.collapsed(hintText: 'Escribe el monto...'),
          onChanged: (String? value) {
            onCurrencyChange(context);
          },
        ));
  }

  onCurrencyChange(BuildContext context) {
    print("Holaa"+input);
    if (input != textController.text) {
      if (debounce?.isActive ?? false) debounce?.cancel();
      debounce = Timer(const Duration(milliseconds: 700), () {
        input = textController.text;
        context.read<CurrencyProvider>().getCurrency(textController.text);
      });
    }
  }
}
