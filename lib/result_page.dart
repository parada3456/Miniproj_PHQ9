import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.result});
  final String result;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '\n',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          CircleAvatar(
            radius: 70.0,
            backgroundImage: AssetImage('images/SuccessKid.jpg'),
          ),
          Padding(
            padding : EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "ผลการทดสอบ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.indigo,
                  fontFamily: 'Mitr',
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.indigo,
                    fontFamily: 'Mitr',
                  ),
                ),
              ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstScreen()));
            },
            child: Expanded(
              child: Container(
                child: Text(
                  S.of(context)!.home,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Mitr',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                color: Colors.amber,
                height: 50.0,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
