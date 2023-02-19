import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:nuova_prova_1/main.dart';
import 'package:nuova_prova_1/squadra.dart';
import 'package:nuova_prova_1/squadra_builder.dart';
import 'package:nuova_prova_1/squadra_builder2.dart';


class Classifica extends StatefulWidget {
  @override
  _ClassificaState createState() => _ClassificaState();
}

class _ClassificaState extends State<Classifica> {


  void resetSquadre(){
    MyApp.listaSquadre = [];
    MyApp.puntSquadre = [0,0,0,0,0];
    setState(() {
    });
  }

  void resetSquadra(String squadra, int i){
    MyApp.listaSquadre.remove(squadra);
    MyApp.puntSquadre.remove(i);
    MyApp.puntSquadre.add(0);
    setState(() {
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Image.asset(
              'assets/images/sfondo.jpg',
              color: Colors.white.withOpacity(0.7),
              colorBlendMode: BlendMode.modulate,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            left: 0,
            top: 60,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0),
                  shape: BoxShape.circle,
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(10, 10),
                        color: Colors.black38,
                        blurRadius: 15),
                    BoxShadow(
                        offset: const Offset(-10, -10),
                        color: Colors.white.withOpacity(0.6),
                        blurRadius: 15)
                  ]),
              child: IconButton(
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  size: 70,
                  color: Colors.black,
                ),
              ),
            ),
          ),




          Positioned(
            width: MediaQuery.of(context).size.width - 30,
            left: 15,
            top: 180,
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      const SizedBox(height: 15),

                      Row(children: [

                        const Text(
                          'Classifica',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),

                        const Spacer(),

                        IconButton(
                          onPressed: resetSquadre,
                          icon: const Icon(Icons.remove_circle),
                        ),

                      ],),


                      const SizedBox(height: 15),


                      for (int i = 0; i < MyApp.listaSquadre.length; i++)
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget> [

                              IconButton(
                                onPressed: () { resetSquadra(MyApp.listaSquadre[i], MyApp.puntSquadre[i]); },
                                icon: const Icon(Icons.remove_circle_outline),
                              ),

                              Text(
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                  //listaSquadre.isNotEmpty?listaSquadre.toString():""
                                  MyApp.listaSquadre[i]
                              ),

                              const Spacer(),

                              IconButton(
                                iconSize: 20,
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  //minus();
                                  setState(() {
                                    if (MyApp.puntSquadre[i] != 0) {
                                      MyApp.puntSquadre[i]--;
                                    }
                                  });
                                },
                              ),

                              Text('${MyApp.puntSquadre[i]}', style: const TextStyle(fontSize: 30.0)),

                              IconButton(
                                iconSize: 20,
                                icon: const Icon(Icons.add_circle),
                                onPressed: () {
                                  //add();
                                  setState(() {
                                    MyApp.puntSquadre[i]++;
                                  });
                                },
                              ),


                            ]
                        ),


                    ],
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
