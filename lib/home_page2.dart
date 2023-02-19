import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const im1 = 'assets/images/1';
const im2 = 'assets/images/2';

/*showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed:  () {},
  );
  Widget continueButton = TextButton(
    child: const Text("Continue"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("AlertDialog"),
    content: const Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}*/


class HomePage2 extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}


class _HomePage2State extends State<HomePage2> {

  //final String c = "Bifdsua";
  //int dropDownValue = 1;
  //int dropDownValue2 = 1;



  @override
  Widget build(BuildContext context) => Scaffold(

    //backgroundColor: Colors.lightGreen,

    body: SingleChildScrollView(

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //const Text("This lesson is about the Text Widget"),
          /*Container(
            constraints: const BoxConstraints.expand(height: 300),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/2.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),*/
          //const Text("This lesson is about the Text Widget"),

          //aggiunge uno spazio
          //const SizedBox(height: 10),

          /*Positioned(
            top: 0,
            child: Image.asset(
              'assets/images/GUESS_the_image3.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),*/

          /*Image.asset(
            'assets/images/2.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),*/


          /*IconButton(
            icon: Image.asset(
              'assets/images/1.png',
            ),
            iconSize: 50,
            onPressed: () {
              //Route route = MaterialPageRoute(builder: (context) => const NewPage());
              //Navigator.push(context, route);
              //Navigator.pushNamed(context, '/new_page');
              showAlertDialog(context);
            },
          ),*/


          /*Builder(
            builder: (BuildContext b) => const Text('HOME PAGE'),
          ),*/

          const SizedBox(height: 50),
          //const Spacer(),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black87),
              padding: MaterialStateProperty.all(const EdgeInsets.all(50)),
              textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),

            onPressed: () {
              //String h = c;
              //Article article = Article(c);
              //Navigator.pushNamed(context, '/new_page', arguments: dropDownValue);
              Navigator.pushNamed(context, '/new_page');
              //Navigator.of(context).pushNamed('/new_page');
            }, child: const Text('Click'),
          ),

          /*DropdownButton<int>(
            hint: const Text("Pick"),
            value: dropDownValue,
            items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((int value) {
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
          ),*/

          /*
          DropdownButton<int>(
              hint: const Text("Pick"),
              value: dropDownValue2,
              items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (newVal) {
                setState(() {
                  dropDownValue2 = newVal!;
                  /*for( ; ; ){

              };*/
                });
              }
          ),

           */

        ],
      ),
    ),
  );
}