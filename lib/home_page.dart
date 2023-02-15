import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const backgroundImage = 'assets/images/GUESS_the_image3.png';
const bottoneInizia = 'assets/images/bottone.png';

class HomePage extends StatelessWidget {
    const HomePage({super.key});




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      //appBar: AppBar(),
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
                Navigator.pushNamed(context, '/categorie');
              },
              child: Text(
                'INIZIA',
                style: GoogleFonts.peralta(fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),
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
                  Navigator.pushNamed(context, '/regolamento');
                },
              ),
            ),
          ),




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
          ),





        ],
      ),
    );
  }
}