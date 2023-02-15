import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'squadra.dart';


class SquadraBuilder2 extends StatefulWidget {

  const SquadraBuilder2({
    Key? key,
    required this.future,
  }) : super(key: key);
  final Future<List<Squadra>> future;

  @override
  _SquadraBuilder2State createState() => _SquadraBuilder2State();
}


class _SquadraBuilder2State extends State<SquadraBuilder2> {

  int _counterValue = 0;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Squadra>>(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final squadra = snapshot.data![index];
              return _buildSquadraCard(squadra, context);
            },
          ),
        );


      },
    );
  }

  Widget _buildSquadraCard(Squadra squadra, BuildContext context) {


    return Card(
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget> [

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Text(
                  squadra.nome,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 15,)

              ],
            ),

            const SizedBox(width: 15),

            const Spacer(),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[


                CounterButton(
                  loading: false,
                  onChange: (int val) {
                    setState(() {
                      _counterValue = val++;
                    });
                  },
                  count: _counterValue,
                  countColor: Colors.blue,
                  buttonColor: Colors.blueAccent,
                  progressColor: Colors.blueAccent,
                ),


                /*
                Text(
                    squadra.punteggio.toString()
                ),*/


                const SizedBox(height: 15,)

              ],
            ),
          ]
      ),
    );





  }

}
