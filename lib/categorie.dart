import 'package:flutter/material.dart';

class Categorie extends StatelessWidget {
  const Categorie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [


            Positioned(
              top: 0,
              child: Image.asset(
                'assets/images/GUESS_the_image_clean.png',
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),


            Positioned(
              left: 100, //MediaQuery.of(context).size.width/3,
              top: 520, //MediaQuery.of(context).size.height/2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    fixedSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {
                  Navigator.pushNamed(context, '/pag_categoria1');
                },
                child: const Text(
                  'Categoria1',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),

            Positioned(
              left: 100, //MediaQuery.of(context).size.width/3,
              top: 100, //MediaQuery.of(context).size.height/2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    fixedSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {
                  Navigator.pushNamed(context, '/home_page');
                },
                child: const Text(
                  'Indietro',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),


          ]
        )
    );
  }
}