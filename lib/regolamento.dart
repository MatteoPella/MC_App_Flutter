import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Regolamento extends StatelessWidget {
  Regolamento({super.key});


  @override
  Widget build(BuildContext context) {

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
                  //Navigator.pushNamed(context, '/pagina_dropdownbutton');
                  //Navigator.pop(context);
                  Navigator.pop(context);

                },
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  size: 70,
                  color: Colors.black,
                ),
              ),
            ),
          ),




          Positioned(
            width: MediaQuery.of(context).size.width - 30,
            left: 15,
            top: 180,
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: <Widget>[

                  Row(
                    children: const <Widget>[

                      SizedBox(height: 10,),

                    ],
                  ),

                  Row(
                    children: <Widget>[

                      const SizedBox(width: 10,),

                      Text(
                        'MIMIC PICTURE',
                        style: GoogleFonts.peralta(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 15,),

                  Row(
                    children: <Widget>[

                      const SizedBox(width: 10,),

                      Expanded(
                        child: Text(
                          'Mimic Picture è un\'app di supporto al gioco stesso, '
                          'che viene svolto fisicamente, non sul dispositivo. '
                          'Sono presenti varie categorie di immagini, dalle quali ne viene '
                          'selezionata una casualmente. Un giocatore deve mimare l\'immagine '
                          'generata e farla indovinare alla propria squadra, '
                          'con un tempo massimo di due minuti (è possibile '
                          'cambiare questo valore). Ovviamente, solo la persona '
                          'che mima può assistere alla rivelazione dell\'immagine.',
                          style: GoogleFonts.peralta(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}