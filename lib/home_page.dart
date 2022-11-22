import 'package:flutter/material.dart';

const backgroundImage = 'assets/images/GUESS_the_image3.png';
const bottoneInizia = 'assets/images/bottone.png';

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Stack(
        children: [

          Positioned(
            child: Image.asset(
              backgroundImage,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),

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

          Positioned(
            left: 0, //MediaQuery.of(context).size.width/3,
            top: 670, //MediaQuery.of(context).size.height/2,
            child: IconButton(
              //splashRadius: 100,
              iconSize: 100,
              icon: Image.asset('assets/images/regolamento.png'),
              onPressed: () {
                Navigator.pushNamed(context, '/regolamento');
              },
            ),
          ),

        ],
      ),
    );
  }
}