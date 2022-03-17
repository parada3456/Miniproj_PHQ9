import 'package:flutter/material.dart';
import 'quizzler_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(
    MaterialApp(
      title: 'PHQ-9',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.supportedLocales,
      home: FirstScreen(),
    ),
  );
}

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '\n\n',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          /*CircleAvatar(
            radius: 70.0,
            backgroundImage: AssetImage('images/untame.jpg'),
          ),*/
        Padding(
          padding : EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.5),
            child: Text(
              S.of(context)!.head,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Mitr',
                fontWeight: FontWeight.normal,
                color: Colors.indigo,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              S.of(context)!.from,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Mitr',
                color: Colors.cyan,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Text(
            '\n',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            S.of(context)!.type,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Mitr',
              color: Colors.indigo,
              fontWeight: FontWeight.w100,
            ),
            ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: myController,
                ),
              ),
            ),
          ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Quizzler(name: myController.text)));
            },
          child: Expanded(
            child: Container(
              child: Text(
                S.of(context)!.next,
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