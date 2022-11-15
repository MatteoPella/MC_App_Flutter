import 'package:flutter/material.dart';
import 'dart:math';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage>
    with SingleTickerProviderStateMixin {
  int x = 1;
  int y = 1;
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
          x = Random().nextInt(2) + 1;
          y = Random().nextInt(2) + 1;
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
        children: [


          Positioned(
            top: 0,
            child: Image.asset(
              backgroundImage,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),



          Positioned(
            left: 50, //MediaQuery.of(context).size.width/3,
            top: 200, //MediaQuery.of(context).size.height/2,
            child: Image(height:300- (animation.value)*200,
              image: AssetImage(
                  'assets/images/$x.png'
              ),
            ),
          ),




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
