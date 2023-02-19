import 'package:Mimic_Picture/utils/locator.dart';
import 'package:Mimic_Picture/utils/prefer.dart';
import 'package:Mimic_Picture/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'View_Model/home_view_model.dart';
import 'View_Model/sign_in_view_model.dart';
import 'cat_animali.dart';
import 'cat_casuale.dart';
import 'cat_sport.dart';
import 'pagina_dropdownbutton.dart';
import 'inserSquadra.dart';
import 'home_page.dart';
import 'cat_film.dart';
import 'new_page_2.dart';
import 'new_page_3.dart';


/*
void main() {
  runApp(const MyApp());
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Prefs.init();
  setLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
    ),
  ],child: MyApp(),));
}


class MyApp extends StatefulWidget{

  static List<int> puntSquadre = [0,0,0,0,0];
  static List<String> listaSquadre = [];

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  //MyApp({Key? key}) : super(key: key);



  late Locale locale;
  bool localeLoaded = false;

  @override
  void initState() {
    super.initState();
    print('initState()');

    //MyApp.setLocale(context, locale);
  }


  /*
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'La mia app',
    theme: ThemeData(
      //primaryColor: const Color(0xFFff6369),
      //backgroundColor: const Color(0x000000ff)
      //scaffoldBackgroundColor: const Color(0xFF3679D4)
    ),
    routes: routing(),
    home: const HomePage(),
  );*/


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.grey[400],
//        statusBarColor: Styles.blueColor,
        statusBarIconBrightness:
        Brightness.light //or set color with: Color(0xFF0000FF)
    ));
    return ChangeNotifierProvider<SignInViewModel>(
      create: (_) => SignInViewModel(),
      child: Center(
        child: MaterialApp(
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.onGenerateRoute,

          theme: ThemeData(
            primaryColor:Colors.black,

            fontFamily: 'FA',

          ),
        ),
      ),
    );
  }



  /*
  Map<String, WidgetBuilder> routing(){
    return {
      '/home_page': (context) => HomePage(),
      '/regolamento': (context) => Regolamento(),
      '/pagina_dropdownbutton': (context) => Pagina_dropdownbutton(),
      '/inserSquadra': (context) => InserSquadra(),
      '/classifica': (context) => Classifica(),
      '/categorie': (context) => const Categorie(),
      '/cat_cartoon': (context) => const CatCartoon(),
      '/cat_sport': (context) => const CatSport(),
      '/cat_film': (context) => const CatFilm(),
      '/cat_animali': (context) => const CatAnimali(),
      '/cat_casuale': (context) => const CatCasuale(),
      '/timer_categoria1': (context) => const TimerCategoria1(),
      '/timer_categoria2': (context) => const TimerCategoria2(),
      '/new_page_2': (context) => const NewPage2(),
      '/new_page_3': (context) => const NewPage3(),
    };
  }*/


}