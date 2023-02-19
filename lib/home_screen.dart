import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void signOutGoogle() async{
    await _googleSignIn.signOut();
    print("User Sign Out");
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Center(
                  child: Text(
                    'Welcome User',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 40),

                Image.asset("assets/im_login/girl.jpg",scale: 5,),

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    signOutGoogle();
                    Navigator.pop(context);
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) {return LoginScreen();}));
                  },
                  //color: Colors.black,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  //elevation: 5,
                  /*shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),*/
                ),

                const SizedBox(height: 100),

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return HomePage();}), ModalRoute.withName('/'));
                  },
                  //color: Colors.black,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Prosegui',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  //elevation: 5,
                  /*shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),*/
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}