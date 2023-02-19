import 'package:Mimic_Picture/timer_categoria2.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

import 'categorie.dart';
import 'classifica.dart';

class CatAnimali extends StatefulWidget {
  const CatAnimali({Key? key}) : super(key: key);

  @override
  _CatAnimaliState createState() => _CatAnimaliState();
}

class _CatAnimaliState extends State<CatAnimali>
    with SingleTickerProviderStateMixin {
  int x = 0; //Random().nextInt(3) + 1;
  late AnimationController _controller;
  late CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  animate(){
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation= CurvedAnimation(parent: _controller,curve: Curves.bounceOut);
    animation.addListener(() {
      setState(() {

      });
      // print(_controller.value);
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          x = Random().nextInt(3) + 1;
          //y = Random().nextInt(2) + 1;
        });
        // print('Completed');
        _controller.reverse();
      }
    });
  }

  void roll() {
    _controller.forward();

  }

  @override
  Widget build(BuildContext context) {

    RouteSettings settings = ModalRoute.of(context)!.settings;
    //String t = settings.arguments.toString();

    return Scaffold(

      //backgroundColor: Colors.lightGreen.withOpacity(0.5),

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
            top: 180,
            child: Container(
              width: 300,
              height: 450,
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
              //child: null,
            ),
          ),



          Positioned(
            top: 200, //MediaQuery.of(context).size.height/2,
            child: Image(height:400- (animation.value)*200,
              image: AssetImage(
                  'assets/images/animali/$x.jpg'
              ),
            ),
          ),



          Positioned(
            //left: 100, //MediaQuery.of(context).size.width/3,
            top: 650, //MediaQuery.of(context).size.height/2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.7),
                  //backgroundColor: Colors.black87,
                  side: const BorderSide(
                    width: 3.0,
                    color: Colors.black45,
                  ),
                  fixedSize: const Size(250, 70),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
              onPressed: () {
                roll();
              },
              child: Text(
                'ROLL',
                style: GoogleFonts.peralta(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),



          /*
          Positioned(
            left: 100,
            top: 700,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  fixedSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () {
                Navigator.pushNamed(context, '/timer_categoria1');
              },
              child: const Text(
                'Avanti',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),

           */







          /*
          Positioned(
            left: 0,
            top: 50,
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
                  //Navigator.pushNamed(context, '/categorie');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Categorie();}));

                },
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  size: 70,
                  color: Colors.black,
                ),
              ),
            ),
          ),*/



          Positioned(
            left: 300,
            top: 50,
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
                  //Navigator.pushNamed(context, '/timer_categoria2');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {return TimerCategoria2();}));

                },
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 70,
                  color: Colors.black,
                ),
              ),
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
          


        ],
      ),


    );
  }
}
