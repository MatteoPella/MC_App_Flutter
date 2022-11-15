import 'package:flutter/material.dart';
import 'package:nuova_prova_1/categorie.dart';
import 'home_page.dart';
import 'home_page2.dart';
import 'new_page.dart';
import 'new_page_2.dart';
import 'new_page_3.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

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
      '/categorie': (context) => const Categorie(),
      '/new_page': (context) => const NewPage(),
      '/new_page_2': (context) => const NewPage2(),
      '/new_page_3': (context) => const NewPage3(),
    };
  }
}