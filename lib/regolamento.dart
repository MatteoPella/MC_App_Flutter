import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Regolamento extends StatelessWidget {
  const Regolamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
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


        ],
      ),
    );
  }
}