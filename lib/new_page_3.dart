import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuova_prova_1/round_button.dart';


class NewPage3 extends StatefulWidget {
  const NewPage3({Key? key}) : super(key: key);

  @override
  _NewPage3State createState() => _NewPage3State();
}


class _NewPage3State extends State<NewPage3>  with TickerProviderStateMixin {


  late AnimationController controller;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '0:00:00') {
      //FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed:  () {
        Navigator.pushNamed(context, '/home_page');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("AlertDialog"),
      content: const Text("Partita finita"),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



  @override
  Widget build(BuildContext context) {

    RouteSettings settings = ModalRoute.of(context)!.settings;
    //article = settings.arguments as Article;
    String t = settings.arguments.toString();

    return Scaffold(
      backgroundColor: const Color(0xfff5fbff),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey.shade300,
                    value: progress,
                    strokeWidth: 6,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isDismissed) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                          height: 300,
                          child: CupertinoTimerPicker(
                            initialTimerDuration: controller.duration!,
                            onTimerDurationChanged: (time) {
                              setState(() {
                                controller.duration = time;
                              });
                            },
                          ),
                        ),
                      );
                    }
                  },
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Text(
                      countText,
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.isAnimating) {
                      controller.stop();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      controller.reverse(
                          from: controller.value == 0 ? 1.0 : controller.value);
                      setState(() {
                        isPlaying = true;
                      });
                    }
                  },
                  child: RoundButton(
                    icon: isPlaying == true ? Icons.pause : Icons.play_arrow,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.reset();
                    setState(() {
                      isPlaying = false;
                    });
                  },
                  child: const RoundButton(
                    icon: Icons.stop,
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    /*
                    int d = int.parse(t);
                    print(d);
                    if(d > 1){
                      int z = d-1;
                      //Navigator.popUntil(context, ModalRoute.withName('/new_page'));
                      Navigator.pushNamed(context, '/new_page', arguments: z);
                    }
                    else{
                      showAlertDialog(context);
                    }
                    //Navigator.pop(context);
                    */
                    showAlertDialog(context);
                  },
                  child:  Text(t),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }


  /*@override
  Widget build(BuildContext context){
    RouteSettings settings = ModalRoute.of(context)!.settings;
    //article = settings.arguments as Article;
    String t = settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('mmm'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ElevatedButton(
                 onPressed: () {
                   int d = int.parse(t);
                   print(d);
                   if(d > 1){
                     int z = d-1;
                     Navigator.pushNamed(context, '/new_page', arguments: z);
                   }
                   else{
                     showAlertDialog(context);
                   }
                 //Navigator.pop(context);
                 },
                 child:  Text(t),
              ),

            ]
          ),
      ),
    );
  }*/
}