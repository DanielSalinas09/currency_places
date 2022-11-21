import 'package:flutter/material.dart';


class SplassScreen extends StatelessWidget {
  const SplassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned(
            top:size.height*0.05,
            left: -size.height*0.2,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: Container(
               
                height: size.height*.5,
                width: size.height*.5,
                
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle
                  ),
                  child: Image.asset(
                    "assets/moneys.png",
                    height: 10,
                    ),
                ),
            ),
          ),
          Positioned(
            bottom: size.height*.20,
            left: 10,
            child: Row(
              children: const [
                Text(
                  "Obtenga la mejor \nexperiencia \nen conversor \nde divisas",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight:FontWeight.w600
                    ),
                  ),
              ],
            )),

          Positioned(
            bottom: 15,
            right: size.width*.25,
            child: InkWell(
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromRGBO(29, 27, 50, 1)
                  ),
                child: Row(
                  children: [
                    FloatingActionButton(
                      backgroundColor:  Theme.of(context).primaryColor,
                      child:const Icon(Icons.arrow_forward),
                      onPressed: (){
                        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
                      }),
                    
                    const Padding(
                      padding: EdgeInsets.only(left: 16,right: 20,top: 15,bottom: 15),
                      child: Text(
                        "Comenzar",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                          ),
                        ),
                    ),
                  ],
                )
                ,),
            ))
        ]),
    );
  }
}