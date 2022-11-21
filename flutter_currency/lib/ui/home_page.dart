import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_currency/provider/currency_provider.dart';
import 'package:flutter_currency/ui/utils/utils.dart';
import 'package:flutter_currency/ui/widgets/input_currency.dart';
import 'package:provider/provider.dart';

import 'places_page.dart';
import 'widgets/item_currency.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter UI Layouts Home Page'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.grid_on),
              ),
              Tab(
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // GridView tab content Widget
            const HomePage(),
            // ListView tab content Widget
            PlacesPage()
          ],
        ),
      ),
    );
  }
}












class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? debounce;
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              //input y dropdown currency
              Row(
                children: [
                  Flexible(child:InputCurrency(textController: textController,)),
                  const SizedBox(width: 10.0),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(217, 217, 217, 1),
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),

                            blurRadius: 1,
                            offset: const Offset(
                                1, 3), // changes position of shadow
                          ),
                        ]),
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Consumer<CurrencyProvider>(
                      builder: (context, state, _) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              menuMaxHeight: 300,
                              underline: Container(),
                              value: state.typeCurrency,
                              items: currency
                                  .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                if (value!.isNotEmpty) {
                                  context
                                      .read<CurrencyProvider>()
                                      .selectTypeCurrency(value);
                                  context
                                      .read<CurrencyProvider>()
                                      .getCurrency(textController.text);
                                }
                              }),
                        );
                      },
                    ),
                  ),
                ],
              ),
              //show currency result
              Consumer<CurrencyProvider>(
                builder: (context, state, _) {
                  if (state.loading) {
                    //if the state is loading 
                    return const SizedBox(
                        height: 400,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ));
                        //if there is no data
                  } else if (!state.loading && state.currencys.rates.isEmpty) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 25),
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(36, 64, 210, .4),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        'No hay monedas que mostrar.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
                    //show currency
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Fecha',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(state.currencys.date),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.currencys.rates.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemCurrency(
                              rates: state.currencys.rates[index],
                              index: index + 1,
                            );
                          },
                        ),
                      ],
                    );
                  }
                },
              )
            ],
          )),
    );
  }

  

 
}
