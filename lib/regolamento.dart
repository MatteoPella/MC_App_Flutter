import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Regolamento extends StatelessWidget {
  const Regolamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [

          Positioned(
            child: Image.asset(
              'assets/images/GUESS_the_image_clean.png',
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            //left: 100, //MediaQuery.of(context).size.width/3,
            //top: 520, //MediaQuery.of(context).size.height/2,
            top: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              //elevation: 0,
              //backgroundColor: Colors.white.withOpacity(0),
              backgroundColor: Colors.black87.withOpacity(0),
              //backgroundColor: Colors.black87,
              //backgroundColor: Colors.transparent,
              side: const BorderSide(
                width: 3.0,
                color: Colors.black45,
              ),
              //fixedSize: const Size(200, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
              onPressed: () {
                Navigator.pushNamed(context, '/home_page');
              },
              child: Text(
                'INDIETRO',
                style: GoogleFonts.peralta(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold),
                //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45, color: Colors.black, fontFamily: 'RaleWay'),
              ),
            ),
          ),


        ],
      ),
    );
  }
}