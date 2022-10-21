import 'package:flutter/material.dart';
import 'dart:math';

class NewPage2 extends StatefulWidget {
  const NewPage2({Key? key}) : super(key: key);

  @override
  _NewPage2State createState() => _NewPage2State();
}

class _NewPage2State extends State<NewPage2>
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

    RouteSettings settings = ModalRoute.of(context)!.settings;
    //article = settings.arguments as Article;
    String t = settings.arguments.toString();

    return Scaffold(

      backgroundColor: Colors.lightBlue,

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

            ElevatedButton(
              onPressed: () {
                //Navigator.pop(context);
                //Navigator.pushNamed(context, '/new_page_3', arguments: t);
                Navigator.pushNamed(context, '/new_page_3');
              },
              child:  Text(t),
            ),

          ],
        ),
      ),
    );
  }
}
