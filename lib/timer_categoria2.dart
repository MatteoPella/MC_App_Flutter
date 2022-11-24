import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuova_prova_1/home_page.dart';
import 'package:nuova_prova_1/round_button.dart';


class TimerCategoria2 extends StatefulWidget {
  const TimerCategoria2({Key? key}) : super(key: key);

  @override
  _TimerCategoria2State createState() => _TimerCategoria2State();
}


class _TimerCategoria2State extends State<TimerCategoria2>  with TickerProviderStateMixin {


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


                Positioned(
                  child: Image.asset(
                    'assets/images/sfondo.jpg',
                    color: Colors.white.withOpacity(0.8),
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
                  //left: 100,
                    top: 200,
                    child: Container(
                      width: 300,
                      height: 300,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.timer, size: 100, color: Colors.grey.shade900),
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
                                  //backgroundColor: Colors.white.withOpacity(0.5),
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ),



                /*
                Container(
                  width: 300,
                  height: 300,
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
                            color: Colors.white.withOpacity(0.85),
                            blurRadius: 15)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.timer, size: 100, color: Colors.grey.shade900),
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
                              //backgroundColor: Colors.white.withOpacity(0.5),
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                 */









                Positioned(
                  left: 90,
                    top: 520,
                    child: Container(
                      width: 100,
                      height: 100,
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
                      child: GestureDetector(
                        onTap: () {
                          controller.reset();
                          setState(() {
                            isPlaying = false;
                          });
                        },
                        child:  const Icon(
                          Icons.stop,
                          size: 100,
                        ),
                      ),
                    ),
                ),




                Positioned(
                  left: 200,
                  top: 520,
                  child: Container(
                    width: 100,
                    height: 100,
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
                        size: 100,
                      ),
                    ),
                  ),
                ),





                const Positioned(
                  //left: 100,
                  top: 300,
                  child: Icon(
                    null,
                    size: 300,
                  )
                ),














                Positioned(
                  left: 20,
                  top: 700,
                  child: Container(
                    width: 90,
                    height: 90,
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
                        size: 70,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),




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
                          Navigator.pushNamed(context, '/pag_categoria1');
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
                  left: 280,
                  top: 700,
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
                        Icons.restart_alt_rounded,
                        size: 70,
                        color: Colors.black,
                      ),
                    )
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