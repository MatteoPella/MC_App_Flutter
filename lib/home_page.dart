import 'package:Mimic_Picture/regolamento.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'categorie.dart';
import 'inserSquadra.dart';
import 'login_screen.dart';

//const backgroundImage = 'assets/images/GUESS_the_image3.png';
const bottoneInizia = 'assets/images/bottone.png';

class HomePage extends StatelessWidget {
    HomePage({super.key});

    final GoogleSignIn _googleSignIn = GoogleSignIn();

    void signOutGoogle() async{
      await _googleSignIn.signOut();
      print("User Sign Out");
    }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      //appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.center,
            children: [

              Positioned(
                child: Image.asset(
                  'assets/images/sfondo.jpg',
                  color: Colors.white.withOpacity(0.7),
                  colorBlendMode: BlendMode.modulate,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  //height: MediaQuery.of(context).size.height,
                  //width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),


              Positioned(
                top: 220,
                child: Container(
                    width: 310,
                    height: 140,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0),
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          const BoxShadow(
                              offset: Offset(10, 10),
                              color: Colors.black38,
                              blurRadius: 15),
                          BoxShadow(
                              offset: const Offset(-10, -10),
                              color: Colors.white.withOpacity(0.6),
                              blurRadius: 15)
                        ]
                    ),
                    child: null
                ),
              ),

              Positioned(
                  top: 200,
                  child: Center(
                    child: Text(
                      'MIMIC',
                      style: GoogleFonts.peralta(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ),

              Positioned(
                  top: 300,
                  child: Center(
                    child: Text(
                      'PICTURE',
                      style: GoogleFonts.peralta(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ),

              /*
          Positioned(
            top: 250,
            child: Container(
              //width: 120,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0),
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      const BoxShadow(
                          offset: Offset(10, 10),
                          color: Colors.black38,
                          blurRadius: 15),
                      BoxShadow(
                          offset: const Offset(-10, -10),
                          color: Colors.white.withOpacity(0.6),
                          blurRadius: 15)
                    ]
                ),
                child: Center(
                  child: Text(
                    'PICTURE',
                    style: GoogleFonts.peralta(
                      fontSize: 70,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ),
          ),*/



              /*
          Positioned(
            left: 0, //MediaQuery.of(context).size.width/3,
            top: 350, //MediaQuery.of(context).size.height/2,
            child: IconButton(
              //splashRadius: 100,
              iconSize: 350,
              icon: Image.asset(bottoneInizia),
              onPressed: () {
                Navigator.pushNamed(context, '/categorie');
              },
            ),
          ),
          */



              Positioned(
                left: 320,
                top: 60,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
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
                      signOutGoogle();
                      //Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {return LoginScreen();}));
                    },
                    icon: const Icon(
                      Icons.logout,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),



              Positioned(
                top: 500,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.7),
                      //backgroundColor: Colors.black87,
                      side: const BorderSide(
                        width: 3.0,
                        color: Colors.black45,
                      ),
                      fixedSize: const Size(350, 80),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    //Navigator.pushNamed(context, '/categorie');
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Categorie();}));

                  },
                  child: Text(
                    'INIZIA',
                    style: GoogleFonts.peralta(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),







              Positioned(
                left: 0,
                top: 700,
                child: Container(
                  width: 120,
                  height: 120,
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
                      ]
                  ),
                  child: IconButton(
                    //splashRadius: 100,
                    iconSize: 100,
                    icon: Image.asset('assets/images/regolamento.png'),
                    onPressed: () {
                      //Navigator.pushNamed(context, '/regolamento');
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Regolamento();}),);

                    },
                  ),
                ),
              ),




              /*
          Positioned(
            left: 250,
            top: 700,
            child: Container(
              width: 120,
              height: 120,
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
                  ]
              ),
              child: IconButton(
                //splashRadius: 100,
                iconSize: 70,
                icon: const Icon(Icons.leaderboard_outlined),
                onPressed: () {
                  Navigator.pushNamed(context, '/inserSquadra');
                },
              ),
            ),
          ),*/





              Positioned(
                left: 220,
                top: 700,
                child: Container(
                    width: 180,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0),
                        shape: BoxShape.rectangle,
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          IconButton(
                            onPressed: () {
                              //Navigator.pushNamed(context, '/inserSquadra');
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {return InserSquadra();}));

                            },
                            icon: const Icon(
                              Icons.add_circle,
                              size: 50,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(
                              height: 10
                          ),

                          Text(
                            'SQUADRE',
                            style: GoogleFonts.peralta(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ]
                    )
                ),
              ),





            ],
          );
        }
      )
    );
  }
}