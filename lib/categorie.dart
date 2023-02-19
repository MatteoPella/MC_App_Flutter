import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuova_prova_1/cat_animali.dart';
import 'package:nuova_prova_1/cat_casuale.dart';
import 'package:nuova_prova_1/home_page.dart';
import 'package:nuova_prova_1/cat_film.dart';

import 'cat_cartoon.dart';
import 'cat_sport.dart';
import 'classifica.dart';

class Categorie extends StatelessWidget {
  const Categorie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [


            Positioned(
              top: 0,
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
              left: 150,
              top: 60,
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
                  iconSize: 50,
                  icon: const Icon(Icons.leaderboard),
                  onPressed: () {
                    //Navigator.pushNamed(context, '/classifica');
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Classifica();}));

                  },
                ),
              ),
            ),



            Positioned(
              //left: 100, //MediaQuery.of(context).size.width/3,
              top: 200, //MediaQuery.of(context).size.height/2,
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
                  //Navigator.pushNamed(context, '/pag_categoria1');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {return CatCartoon();}));

                },
                child: Text(
                  'CARTOON',
                  style: GoogleFonts.peralta(fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Positioned(
              //left: 100, //MediaQuery.of(context).size.width/3,
              top: 310, //MediaQuery.of(context).size.height/2,
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
                  //Navigator.pushNamed(context, '/pag_categoria1');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {return CatSport();}));

                },
                child: Text(
                  'SPORT',
                  style: GoogleFonts.peralta(fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Positioned(
              //left: 100, //MediaQuery.of(context).size.width/3,
              top: 420, //MediaQuery.of(context).size.height/2,
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
                  //Navigator.pushNamed(context, '/pag_categoria1');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {return CatFilm();}));

                },
                child: Text(
                  'FILM',
                  style: GoogleFonts.peralta(fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Positioned(
              //left: 100, //MediaQuery.of(context).size.width/3,
              top: 530, //MediaQuery.of(context).size.height/2,
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
                  //Navigator.pushNamed(context, '/pag_categoria1');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {return CatAnimali();}));

                },
                child: Text(
                  'ANIMALI',
                  style: GoogleFonts.peralta(fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Positioned(
              //left: 100, //MediaQuery.of(context).size.width/3,
              top: 640, //MediaQuery.of(context).size.height/2,
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
                  //Navigator.pushNamed(context, '/pag_categoria1');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {return CatCasuale();}));

                },
                child: Text(
                  'CASUALE',
                  style: GoogleFonts.peralta(fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),



            /*
            Positioned(
              left: 0,
              top: 60,
              child: Container(
                width: 70,
                height: 70,
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
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home_page');
                  },
                  icon: const Icon(
                    Icons.home,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            */



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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {return HomePage();}));

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
            Positioned(
              left: 10, //MediaQuery.of(context).size.width/3,
              top: 150, //MediaQuery.of(context).size.height/2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    fixedSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {
                  Navigator.pushNamed(context, '/home_page');
                },
                child: const Text(
                  'Indietro',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            */


          ]
        )
    );
  }
}