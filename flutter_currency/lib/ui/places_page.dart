import 'package:flutter/material.dart';
import 'package:flutter_currency/provider/place_provider.dart';
import 'package:provider/provider.dart';

import '../models/place_modal.dart';
import 'widgets/input_place.dart';

class PlacesPage extends StatefulWidget {
  const PlacesPage({super.key});

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
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
            child: Column(children: [
              const SizedBox(
                height: 10.0,
              ),
              //input y dropdown currency
              Row(children: [
                Flexible(
                    child: InputPlaces(
                  textController: textController,
                )),
                const SizedBox(width: 10.0),
              ]),
              const SizedBox(
                height: 10.0,
              ),
              Consumer<PlacesProvider>(builder: (context, state, _) {
                if (state.loading) {
                    //if the state is loading 
                    return const SizedBox(
                        height: 400,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ));
                        //if there is no data
                  } else if (!state.loading && state.places.isEmpty) {
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
                    //show currency
                  } else {
                    return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.places.length,
                    itemBuilder: (BuildContext context, int position) {
                      return ItemPlace(
                        item: state.places[position],
                      );
                    });
                  }
                
              })
            ])));
  }
}

class ItemPlace extends StatelessWidget {
  final Place item;
  const ItemPlace({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<PlacesProvider>().getDetail(item.xid);
        Navigator.pushNamed(context, 'detail',arguments: {'name':item.name});
      },
//      isThreeLine: true,
      title: Text(
        item.name,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        item.kinds,
        maxLines: 2,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      
    );
  }
}
