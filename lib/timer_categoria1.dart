import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuova_prova_1/home_page.dart';
import 'package:nuova_prova_1/round_button.dart';


class TimerCategoria1 extends StatefulWidget {
  const TimerCategoria1({Key? key}) : super(key: key);

  @override
  _TimerCategoria1State createState() => _TimerCategoria1State();
}


class _TimerCategoria1State extends State<TimerCategoria1>  with TickerProviderStateMixin {


  late AnimationController controller;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '00:00') {
      //FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 180),
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



    /*
    return Scaffold(

      body: Stack(
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

        ],
      ),
      */



    RouteSettings settings = ModalRoute.of(context)!.settings;
    //article = settings.arguments as Article;
    //String t = settings.arguments.toString();

    return Scaffold(
      backgroundColor: const Color(0xfff5fbff),
      body: Column(
        children: [


          Expanded(
            child: Stack(

              alignment: Alignment.center,
              children: [


                Opacity(
                  opacity: 0.7,
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

                 */



                Positioned(
                  top: 600,
                  left: 190,
                  child: GestureDetector(
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
                    child: Icon(
                      isPlaying == true ? Icons.pause : Icons.play_arrow,
                      size: 130,
                    ),
                  ),
                ),


                Positioned(
                  top: 600,
                  left: 70,
                  child: GestureDetector(
                    onTap: () {
                      controller.reset();
                      setState(() {
                        isPlaying = false;
                      });
                    },
                    child:  const Icon(
                      Icons.stop,
                      size: 130,
                    ),

                    //child: const RoundButton(
                      //icon: Icons.stop,
                    //),
                  ),
                ),


                /*
                Positioned(
                  top: 700,
                  child: ElevatedButton(
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    child: const Text(
                      'Fine',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),

                 */


















                Positioned(
                  top: 100,
                  child: GestureDetector(
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
                      style: TextStyle(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ),





                Positioned(
                  //top: 100,
                    width: 350,
                    height: 350,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.5),
                    )
                ),



                Positioned(
                  //top: 100,
                  width: 350,
                  height: 350,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    value: progress,
                    strokeWidth: 14,
                  ),
                ),

                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) => Text(
                    countText,
                    style: const TextStyle(
                      //backgroundColor: Colors.white.withOpacity(0.6),
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),









                Positioned(
                  left: 0,
                  top: 50,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/pag_categoria1');
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_rounded,
                      size: 70,
                      color: Colors.black,
                    ),
                  ),
                ),



                /*
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
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                */





                Positioned(
                  left: 0,
                  top: 700,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home_page');
                    },
                    icon: const Icon(
                      Icons.home,
                      size: 70,
                      color: Colors.black,
                    ),
                  ),
                ),


                Positioned(
                  left: 300,
                  top: 700,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/categorie');
                    },
                    icon: const Icon(
                      Icons.restart_alt_rounded,
                      size: 70,
                      color: Colors.black,
                    ),
                  ),
                ),






              ],
            ),
          ),




          /*
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
                    showAlertDialog(context);
                  },
                  child: const Text(
                    'Fine',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),

              ],
            ),
          )
          */










        ],
      ),
    );


  }
}