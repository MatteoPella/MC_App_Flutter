import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class PagCategoria1 extends StatefulWidget {
  const PagCategoria1({Key? key}) : super(key: key);

  @override
  _PagCategoria1State createState() => _PagCategoria1State();
}

class _PagCategoria1State extends State<PagCategoria1>
    with SingleTickerProviderStateMixin {
  int x = Random().nextInt(3) + 1;
  //int y = 1;
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

    const backgroundImage = 'assets/images/GUESS_the_image_clean.png';

    RouteSettings settings = ModalRoute.of(context)!.settings;
    //article = settings.arguments as Article;
    String t = settings.arguments.toString();

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
            //left: 50, //MediaQuery.of(context).size.width/3,
            top: 200, //MediaQuery.of(context).size.height/2,
            child: Image(height:300- (animation.value)*200,
              image: AssetImage(
                  'assets/images/$x.jpg'
              ),
            ),
          ),




          /*
          Positioned(
            left: 100, //MediaQuery.of(context).size.width/3,
            top: 520, //MediaQuery.of(context).size.height/2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  fixedSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: roll,
              child: const Text(
                'Roll',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),

           */

          Positioned(
            //left: 100, //MediaQuery.of(context).size.width/3,
            top: 510, //MediaQuery.of(context).size.height/2,
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








          Positioned(
            left: 0,
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
                  Navigator.pushNamed(context, '/categorie');
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
            left: 300,
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
                  Navigator.pushNamed(context, '/timer_categoria2');
                },
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 70,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          


        ],
      ),



      /*
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: roll,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image(height:200- (animation.value)*200,
                        image: AssetImage(
                            'assets/images/$x.png'),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            ElevatedButton(
              onPressed: roll,
              child: const Text(
                'Roll',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            /*
            ElevatedButton(
              onPressed: () {
                //Navigator.pop(context);
                //Navigator.pushNamed(context, '/new_page_2', arguments: t);
                Navigator.pushNamed(context, '/new_page_2');
              },
              child:  Text(t),
            ),

             */

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/new_page_2');
                //Navigator.pushNamed(context, '/new_page_2');
              }, child: const Text('ooooo'),
            ),

          ],
        ),
      ),
      */

    );
  }
}
