import 'package:flutter/material.dart';
import 'package:nuova_prova_1/categorie.dart';
import 'package:nuova_prova_1/classifica.dart';
import 'pagina_dropdownbutton.dart';
import 'inserSquadra.dart';
import 'package:nuova_prova_1/regolamento.dart';
import 'package:nuova_prova_1/timer_categoria1.dart';
import 'package:nuova_prova_1/timer_categoria2.dart';
import 'home_page.dart';
import 'home_page2.dart';
import 'pag_categoria1.dart';
import 'new_page_2.dart';
import 'new_page_3.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);


  //static var coun = 0;

  //static Map map = <int, String>{};

  static List<int> puntSquadre = [0,0,0,0,0];
  static List<String> listaSquadre = [];



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
  );


  Map<String, WidgetBuilder> routing(){
    return {
      '/home_page': (context) => const HomePage(),
      '/regolamento': (context) => Regolamento(),
      '/pagina_dropdownbutton': (context) => Pagina_dropdownbutton(),
      '/inserSquadra': (context) => InserSquadra(),
      '/classifica': (context) => Classifica(),
      '/categorie': (context) => const Categorie(),
      '/pag_categoria1': (context) => const PagCategoria1(),
      '/timer_categoria1': (context) => const TimerCategoria1(),
      '/timer_categoria2': (context) => const TimerCategoria2(),
      '/new_page_2': (context) => const NewPage2(),
      '/new_page_3': (context) => const NewPage3(),
    };
  }
}