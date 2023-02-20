import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'View_Model/sign_in_view_model.dart';
import 'base/base_view.dart';
import 'home_page.dart';
import 'splash.dart';
import 'utils/util.dart';
import 'utils/view_state.dart';
import 'package:google_sign_in/google_sign_in.dart';



class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{


  final GlobalKey<FormState> _userLoginFormKey = GlobalKey();
  late User _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isSignIn =false;
  bool google =false;


  @override
  Widget build(BuildContext context) {

    return BaseView<SignInViewModel>(
        onModelReady: (model) {},
        builder: (context, model, build) {
          return WillPopScope(
            child: SafeArea(
              child: Scaffold(
                backgroundColor: const Color(0xFFE6E6E6),





                body: Stack(
                  alignment: Alignment.center,
                  children: [


                    Positioned(
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
                      top: 220,
                      child: Container(
                          width: 310,
                          height: 140,
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
                          child: null
                      ),
                    ),

                    Positioned(
                        top: 200,
                        child: Center(
                          child: Text(
                            'MIMIC',
                            style: GoogleFonts.peralta(
                              fontSize: 50,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ),

                    Positioned(
                        top: 300,
                        child: Center(
                          child: Text(
                            'PICTURE',
                            style: GoogleFonts.peralta(
                              fontSize: 50,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ),




                    Positioned(
                      //width: MediaQuery.of(context).size.width - 30,
                      //left: MediaQuery.of(context).size.width - 30,
                      top: 500,
                        child: InkWell(
                          child: Container(
                            width: 300,
                              //width: deviceSize.width,
                              height: deviceSize.height/18,
                              margin: const EdgeInsets.only(top: 25),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:Colors.black
                              ),
                              child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                              AssetImage('assets/im_login/google.jpg'),
                                              fit: BoxFit.cover),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const Text('Sign in with Google',
                                        style: TextStyle(
                                            fontSize: 23.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                    ],
                                  )
                              )
                          ),
                          onTap: ()
                          async{
                            signInWithGoogle(model)
                                .then((User? user){
                              model.clearAllModels();
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {return HomePage();}));

                              /*
                                          Navigator.of(context).pushNamedAndRemoveUntil
                                            (RouteName.Home, (Route<dynamic> route) => false
                                          )*/

                              ;}

                            ).catchError((e) => print(e));
                          },
                        ),
                    ),

                    model.state==ViewState.Busy
                        ? Utils.progressBar()
                        : Container(),



                  ],

                ),



              ),
            ),
            onWillPop: () async {
              model.clearAllModels();
              return false;
            },
          );
        }
    );
  }


  Future<User?> signInWithGoogle(SignInViewModel model) async {
    model.state =ViewState.Busy;

    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =

    await googleSignInAccount!.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(

      accessToken: googleSignInAuthentication.accessToken,

      idToken: googleSignInAuthentication.idToken,

    );

    UserCredential authResult = await _auth.signInWithCredential(credential);

    _user = authResult.user!;

    assert(!_user.isAnonymous);


    User currentUser = _auth.currentUser!;

    assert(_user.uid == currentUser.uid);


    model.state =ViewState.Idle;


    return null;


  }
}
