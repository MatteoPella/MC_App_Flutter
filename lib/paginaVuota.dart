import 'package:flutter/material.dart';

class PaginaVuota extends StatelessWidget {
  const PaginaVuota({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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

        ],
      ),
    );
  }
}