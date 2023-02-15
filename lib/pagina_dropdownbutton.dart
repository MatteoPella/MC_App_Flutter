import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Pagina_dropdownbutton extends StatefulWidget {

  @override
  _Pagina_dropdownbuttonState createState() => _Pagina_dropdownbuttonState();
}

class _Pagina_dropdownbuttonState extends State<Pagina_dropdownbutton> {



  final List<int> items = [
    1,
    2,
    3,
    4,
  ];
  int? selectedValue;

  int dropDownValue = 1;



  @override
  Widget build(BuildContext context) {



    //RouteSettings settings = ModalRoute.of(context)!.settings;
    //article = settings.arguments as Article;
    //String t = settings.arguments.toString();


    String demo = 'Matteo';



    return Scaffold(
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
            left: 0,
            top: 60,
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
                  Navigator.pushNamed(context, '/home_page');
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
          Positioned(
            left: 20,
            top: 250,
            child: Container(
              width: 150,
              height: 150,
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
              child: ListView(
                //shrinkWrap: true,
                children: [
                  for (var i = 0; i < 3; i++)
                    Text(
                      'Item $i',
                      style: GoogleFonts.peralta(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
          ),*/












          /*
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              hint: Text(
                'Select Item',
                //style: GoogleFonts.petrona(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme
                      .of(context)
                      .hintColor,
                ),
              ),
              items: items
                  .map((item) =>
                  DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                          fontSize: 14,
                          //fontWeight: FontWeight.bold
                      ),
                    ),
                  ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
              },
              buttonHeight: 40,
              buttonWidth: 140,
              itemHeight: 40,
            ),
          ),*/









          Positioned(
            left: 10,
            top: 200,
            child: Container(
              width: 200,
              height: 50,
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
              child: Text (
                'N° squadre',
                style: GoogleFonts.peralta(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              )
            ),
          ),



          Positioned(
            left: 20,
            top: 240,
            child: Container(
              width: 80,
              height: 80,
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
                  ]
              ),
              child: DropdownButton<int>(
                  //hint: const Text("Pick"),
                  value: dropDownValue,
                  style: GoogleFonts.peralta(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                  items: <int>[1, 2, 3, 4, 5].map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (newVal) {
                    setState(() {
                      dropDownValue = newVal!;
                      /*for( ; ; ){

                };*/
                    });
                  }
              ),
            ),
          ),


          ElevatedButton(
            onPressed: () {
              //Navigator.pop(context);
              //Navigator.pushNamed(context, '/new_page_3', arguments: t);
              //Navigator.pushNamed(context, '/prova1');
              Navigator.pushNamed(context, '/prova1', arguments: dropDownValue);
            },
            child:  const Text(
              'click'
            ),
          ),


          Positioned(
            //left: 100, //MediaQuery.of(context).size.width/3,
            top: 600, //MediaQuery.of(context).size.height/2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.7),
                  //backgroundColor: Colors.black87,
                  side: const BorderSide(
                    width: 3.0,
                    color: Colors.black45,
                  ),
                  fixedSize: const Size(350, 80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () {
                Navigator.pushNamed(context, '/prova1');
              },
              child: Text(
                'Inserisci squadre',
                style: GoogleFonts.peralta(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),





          /*
          Positioned(
            left: 10,
            top: 240,
            child: Container(
              width: 80,
              height: 80,
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
                  ]
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Text(
                    '0',
                    style: GoogleFonts.peralta(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  items: items
                      .map((item) =>
                      DropdownMenuItem<int>(
                        value: item,
                        child: Text(
                          item.toString(),
                          style: GoogleFonts.peralta(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as int;
                    });
                  },
                  //buttonHeight: 40,
                  //buttonWidth: 180,
                  //itemHeight: 40,
                ),
              ),
            ),
          ),*/






          /*for (var i = 1; i <= 3; i++)
            Positioned(
              left: 50,
              top: 200,
              child: Text(
                'Item $i',
                style: GoogleFonts.petrona(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )*/







        ],
      ),
    );
  }
}