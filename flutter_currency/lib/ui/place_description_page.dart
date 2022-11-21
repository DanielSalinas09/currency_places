


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/place_provider.dart';

class PlaceDescriptionPage extends StatelessWidget {
  const PlaceDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final  args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(args['name'])),
      body: Consumer<PlacesProvider>(builder: (context, state, _) {
        if(state.loadingDetail){
          return const SizedBox(
                        height: 400,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ));
        }else if(!state.loadingDetail &&state.placeDetail.xid.isEmpty){
          return Container(
                      margin: const EdgeInsets.symmetric(vertical: 25),
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(36, 64, 210, .4),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        'No se encontro información.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
        }else{
          return SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            const SizedBox(height: 20,),
            state.placeDetail.preview.containsKey('source')?
            Image.network(
              state.placeDetail.preview['source'],
              height: 250,
              width: double.infinity,
              )
              :Center(
                child: Container(
                  height: 250,
                  width: 350,
                  color: const Color.fromRGBO(36, 64, 210, .4),
                  
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children:const  [
                          Icon(Icons.error_outline),
                          SizedBox(width: 5,),
                          Text(
                            'Esta seccion no contiene imagen',
                            style: TextStyle(fontSize: 17),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
          
            Text(
              state.placeDetail.wikipediaExtracts['text'],
              style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 15,),
              const Text(
                'relacionados',
                style: TextStyle(fontSize: 20,color: Colors.grey),
                ),
              const SizedBox(height: 7,),
              Text(
                state.placeDetail.kinds,
                style: const TextStyle(fontSize: 15,),
                )
                  ]),
          );
        }
      })
      
    );
  }
}