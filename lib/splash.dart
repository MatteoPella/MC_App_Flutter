import 'dart:async';
import 'package:flutter/material.dart';
import 'View_Model/sign_in_view_model.dart';
import 'utils/deviceSize.dart';
import 'login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  VideoState createState() => VideoState();
}

late DeviceSize deviceSize;

class VideoState extends State<Splash> with SingleTickerProviderStateMixin{

  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 2));
    animation =
    CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = DeviceSize(
        size: MediaQuery.of(context).size,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        aspectRatio: MediaQuery.of(context).size.aspectRatio);
    return ChangeNotifierProvider<SignInViewModel>(
        create: (_) => SignInViewModel(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Padding(padding: const EdgeInsets.only(bottom: 30.0),child:Image.asset('assets/im_login/powered_by.png',height: 25.0,fit: BoxFit.scaleDown,))

                ],),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/im_login/devs.jpg',
                    width: animation.value * 250,
                    height: animation.value * 250,
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}