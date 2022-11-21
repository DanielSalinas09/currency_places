import 'package:flutter/material.dart';
import 'package:flutter_currency/provider/currency_provider.dart';
import 'package:flutter_currency/provider/place_provider.dart';
import 'package:flutter_currency/ui/home_page.dart';
import 'package:flutter_currency/ui/splash_screen.dart';
import 'package:provider/provider.dart';

import 'ui/place_description_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //inject provider to widget tree
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrencyProvider()),
        ChangeNotifierProvider(create: (_) => PlacesProvider()),

      ],
      child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme:  ThemeData(
               brightness: Brightness.light,
              colorSchemeSeed: const Color.fromRGBO(36, 64, 210, 1),
              
            ),
            initialRoute: "splasScreen",
            
            routes: {
              "home" :(context) => const MyHomePage(),
              "splasScreen":(context) => const SplassScreen(),
              "detail":(context) => const PlaceDescriptionPage(),
            },
          ));
        
      
    
  }
}
