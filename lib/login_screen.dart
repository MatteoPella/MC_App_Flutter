import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nuova_prova_1/home_page.dart';
import 'package:nuova_prova_1/home_screen.dart';
import 'View_Model/sign_in_view_model.dart';
import 'base/base_view.dart';
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
                      //width: MediaQuery.of(context).size.width - 30,
                      //left: MediaQuery.of(context).size.width - 30,
                      top: 300,
                        child: InkWell(
                          child: Container(
                            width: 350,
                              //width: deviceSize.width,
                              height: deviceSize.height/16,
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
                                        height: 40.0,
                                        width: 40.0,
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
                                            fontSize: 25.0,
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



                    Positioned(
                      width: MediaQuery.of(context).size.width - 30,
                      left: 15,
                      top: 400,
                      child: Container(
                        //height: 420,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [


                            /*
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text("Login",style:TextStyle(fontWeight: FontWeight.w800,fontSize: 25),),
                            ),*/



                            InkWell(
                              child: Container(
                                  width: deviceSize
                                      .width/2,
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
                                                fontSize: 16.0,
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

                            //const SizedBox(height: 30,);

                            model.state==ViewState.Busy
                                ? Utils.progressBar()
                                : Container(),

                          ],
                        )
                      ),
                    ),
                  ],

                ),



                /*
                body: Stack(
                  children: <Widget>[

                    Container(
                      height: 410,
                      width: 430,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/im_login/background.png'),
                          fit: BoxFit.contain,
                        ),
                      ),

                    ),

                    SingleChildScrollView(
                      child:Column(
                        children: <Widget>[

                          Container(
                            height: deviceSize.height/2.4,
                            width: deviceSize.width/3,
                            //width: MediaQuery.of(context).size.width - 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                AssetImage('assets/im_login/weddinglogo.png'),
                              ),
                            ),
                          ),




                          Form(
                            key: _userLoginFormKey,
                            child: Padding(
                              padding: const EdgeInsets.only(top:5.0,bottom:15,left: 10,right: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                child: Column(
                                  children: <Widget>[

                                    const Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text("Login",style:TextStyle(fontWeight: FontWeight.w800,fontSize: 25),),
                                    ),


                                    /*
                                    Padding(
                                      padding: const EdgeInsets.only(top:15.0,right: 14,left: 14,bottom: 8),
                                      child: TextFormField(
                                        controller: model.userIdController,
                                        style: const TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 15),
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius
                                                .all(
                                                Radius.circular(15)),
                                          ),
                                          hintText: "Email",
                                          hintStyle: TextStyle(fontSize: 15) ,
                                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                        ),
                                        cursorColor:Colors.black,
                                        keyboardType: TextInputType.emailAddress,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .singleLineFormatter,
                                        ],),),*/


                                    /*
                                    Padding(
                                      padding: const EdgeInsets.only(top:5.0,right: 14,left: 14,bottom: 8),
                                      child: TextFormField(
                                        controller: model.passwordController,
                                        obscureText: !model.passwordVisible,
                                        style: const TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 15),
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius
                                                .all(
                                                Radius.circular(15)),
                                          ),
                                          hintText: "Password",
                                          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                          hintStyle: const TextStyle(fontSize: 15) ,
                                          suffixIcon: IconButton(
                                              icon: Icon(model
                                                  .passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,color: const Color(0xFFE6E6E6),),
                                              onPressed: () {
                                                model.passwordVisible =
                                                !model
                                                    .passwordVisible;
                                              }),),
                                        cursorColor:Colors.black,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .singleLineFormatter,
                                        ],),),*/



                                    //const SizedBox(height: 16,),



                                    InkWell(
                                      child: Container(
                                          width: deviceSize
                                              .width/2,
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
                                                        fontSize: 16.0,
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
                                    const SizedBox(height: 16,),
                                  ],),
                              ),),
                          ),




                        ],
                      ),
                    ),

                    model.state==ViewState.Busy
                        ? Utils.progressBar()
                        : Container(),
                  ],
                ),*/



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
