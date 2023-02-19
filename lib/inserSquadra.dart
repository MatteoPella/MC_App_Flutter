import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:counter_button/counter_button.dart';
import 'package:nuova_prova_1/squadra.dart';
import 'package:nuova_prova_1/squadra_builder.dart';

import 'main.dart';

class InserSquadra extends StatefulWidget {
  @override
  _InserSquadraState createState() => _InserSquadraState();
}

class _InserSquadraState extends State<InserSquadra> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _puntController = TextEditingController();


  //List<String> listaSquadre = [];

  //int _counterValue = 0;

  

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
    RouteSettings settings = ModalRoute.of(context)!.settings;
    //article = settings.arguments as Article;
    //String t = settings.arguments.toString();
    //int t = settings.arguments as int;


    //int _counterValue = 0;


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
                  //Navigator.pushNamed(context, '/home_page');
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  size: 70,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          /*
          const Positioned(
            left: 20,
            top: 150,
            child: Text(
              'Inserisci nome squadra',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),*/

          Positioned(
            width: MediaQuery.of(context).size.width - 30,
            left: 15,
            top: 150,
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Form(
                //key: _cadastroKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Inserisci nome squadra (max 5)',
                        style: GoogleFonts.peralta(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                        /*
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                        ),*/
                      ),

                      /*
                      const Text(
                        '(max 5)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),*/

                      const SizedBox(height: 10),

                      TextFormField(
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(9),
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nome squadra',
                        ),
                        controller: _nomeController,
                      ),

                      const SizedBox(height: 8),

                      /*
                      TextFormField(
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Punteggio',
                        ),
                        controller: _puntController,
                      ),*/

                      TextButton(
                        //onPressed: _onSave,

                        onPressed: () {
                          setState(() {
                            if (_nomeController.text.isNotEmpty) {
                              if (MyApp.listaSquadre.length < 5) {
                                if (MyApp.listaSquadre.contains(_nomeController.text)) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Squadra già presente",
                                      style: GoogleFonts.peralta(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ));
                                  _nomeController.clear();
                                }
                                else {
                                  MyApp.listaSquadre.add(_nomeController.text);
                                  _nomeController.clear();
                                }
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    "Limite di squadre raggiunto",
                                    style: GoogleFonts.peralta(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ));
                                _nomeController.clear();
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  "Text is empty",
                                  style: GoogleFonts.peralta(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ));
                            }
                          });
                        },
                        child: Text(
                          "Aggiungi",
                          style: GoogleFonts.peralta(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                      /*
                      SquadraBuilder(
                        future: _getSquadre(),
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
          ),




          //for (int i = 0; i < listaSquadre.length; i++)
            Positioned(
              width: MediaQuery.of(context).size.width - 30,
              left: 15,
              top: 400,
              child: Container(
                height: 420,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Form(
                  //key: _cadastroKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        const SizedBox(height: 15),

                        Row(children: [

                          Text(
                            'Lista squadre:',
                            style: GoogleFonts.peralta(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          const Spacer(),

                          IconButton(
                            onPressed: resetSquadre,
                            icon: const Icon(Icons.remove_circle),
                          ),

                        ],),


                        const SizedBox(height: 40),


                        for (int i = 0; i < MyApp.listaSquadre.length; i++)
                          Row(
                              //mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget> [

                                IconButton(
                                  onPressed: () { resetSquadra(MyApp.listaSquadre[i], MyApp.puntSquadre[i]); },
                                  icon: const Icon(Icons.remove_circle_outline),
                                ),

                                Text(
                                    style: GoogleFonts.roboto(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
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




          /*
          Positioned(
            left: 50,
            top: 650,
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
                  Navigator.pushNamed(context, '/prova3', arguments: MyApp.listaSquadre);
                },
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 70,
                  color: Colors.black,
                ),
              ),
            ),
          ),*/






          /*
          TextFormField(
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.black,
            ),
            controller: controller,
          ),*/

          /*
          Positioned(
            left: 100,
            top: 250,
            child: TextButton(
              onPressed: () {
                setState(() {
                  if(controller.text.isNotEmpty){
                    listaSquadre.add(controller.text);
                    controller.clear();
                  } else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Text is empty"),
                    ));
                  }
                });
              },
              child: const Text(
                "Aggiungi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),*/

          /*
          Text(
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.red,
              ),
              //listaSquadre.isNotEmpty?listaSquadre.toString():""
              listaSquadre.toString()
          ),*/

          /*
          for (int i = 0; i < listaSquadre.length; i++)
            Positioned(
              left: 20,
              top: coun = coun + 60,
              child: Text(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.red,
                  ),
                  //listaSquadre.isNotEmpty?listaSquadre.toString():""
                  listaSquadre[i]
              ),
            ),*/

          /*
          if (listaSquadre.length == t)
            for (int i = 0; i < listaSquadre.length; i++)
              Positioned(
                left: 20,
                top: coun = coun + 60,
                child: Text(
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.red,
                    ),
                    //listaSquadre.isNotEmpty?listaSquadre.toString():""
                    listaSquadre[i]
                ),
              ),*/

          /*
          //if (listaSquadre.length == t)
            for (int i = 0; i < listaSquadre.length; i++)
              Positioned(
                left: 20,
                top: coun = coun + 60,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          Text(
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.red,
                              ),
                              //listaSquadre.isNotEmpty?listaSquadre.toString():""
                              listaSquadre[i]
                          ),

                        ],
                      ),

                      Column(
                        children: <Widget>[

                          CounterButton(
                            loading: false,
                            onChange: (int val) {
                              setState(() {
                                _counterValue = val;
                              });
                            },
                            count: _counterValue,
                            countColor: Colors.purple,
                            buttonColor: Colors.purpleAccent,
                            progressColor: Colors.purpleAccent,
                          )

                        ],
                      ),
                    ]
                ),
              ),*/

          /*
          Text(
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.red,
              ),
              //listaSquadre.isNotEmpty?listaSquadre.toString():""
              listaSquadre[i]
          ),*/

          /*
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Text("Bio",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 50.0)),

                  ],
                ),
                Column(
                  children: <Widget>[

                    CounterButton(
                      loading: false,
                      onChange: (int val) {
                        setState(() {
                          _counterValue = val;
                        });
                      },
                      count: _counterValue,
                      countColor: Colors.purple,
                      buttonColor: Colors.purpleAccent,
                      progressColor: Colors.purpleAccent,
                    )

                  ],
                ),
              ]
          ),*/

          /*
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),*/

          //TextField(controller: controller),

          /*
          for (int i = 1; i <= t; i++)
            Positioned(
              left: 20,
              top: coun = coun + 60,
              child: Text(
                i.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.red,
                ),
              ),
            ),*/

          /*for (int i = 1; i <= t; i++)
            Positioned(
              left: 20,
              top: coun = coun + 60,
              child: Text(
                controller.text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.red,
                ),
              ),
            ),*/

          //TextField(controller: controller),

          /*
          Positioned(
            left: 20,
            top: 600,
            child: Text(
              controller.text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Colors.red,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
