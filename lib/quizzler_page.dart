import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'result_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  Quizzler({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            S.of(context)!.welcome,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontFamily: 'Mitr',
            ),
          ),
          backgroundColor: Colors.indigo,
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.supportedLocales,
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int totalScore = 0;
  var sh_result;

  void checkAnswer(int userAns) {
    setState(() {
      if (quizBrain.isFinished()) {
        totalScore=totalScore+userAns;
        quizBrain.reset();
        if (9 <= totalScore && totalScore <= 14){
          sh_result = "ท่านมีอาการซึมเศร้าระดับปานกลาง\n\nข้อแนะนำการดูแล\n\nควรพักผ่อนให้เพียงพอ นอนหลับให้ได้ 6-8 ชั่วโมง ออกกำลังกายสม่ำเสมอ ทำกิจกรรมที่ทำให้ผ่อนคลาย พบปะเพื่อนฝูง ควรขอคำปรึกษาช่วยเหลือจากผู้ที่ไว้วางใจ ไม่จมอยู่กับปัญหา มองหาหนทางคลี่คลาย หากอาการที่ท่านเป็นมีผลกระทบต่อการทำงานหรือการเข้าสังคม หรือหากท่านมีอาการระดับนี้มานาน 1-2 สัปดาห์แล้วยังไม่ดีขึ้น ควรพบแพทย์เพื่อรับการช่วยเหลือรักษา";
        } else if (5 <= totalScore && totalScore <= 8) {
          sh_result ="ท่านมีอาการซึมเศร้าระดับเล็กน้อย\n\nข้อแนะนำการดูแล\n\nควรพักผ่อนให้เพียงพอ นอนหลับให้ได้ 6-8 ชั่วโมง ออกกำลังกายสม่ำเสมอ ทำกิจกรรมที่ทำให้ผ่อนคลาย พบปะเพื่อนฝูง และควรทำแบบประเมินอีกครั้งใน 1 สัปดาห์";
        } else if (15 <= totalScore && totalScore <= 19) {
          sh_result ="ท่านมีอาการซึมเศร้าระดับรุนแรงค่อนข้างมาก\n\nข้อแนะนำการดูแล\n\nควรพบแพทย์เพื่อประเมินอาการและให้การรักษา ระหว่างนี้ควรพักผ่อนให้เพียงพอ นอนหลับให้ได้ 6-8 ชั่วโมง ออกกำลังกายเบาๆ ทำกิจกรรมที่ทำให้ผ่อนคลาย ไม่เก็บตัว และควรขอคำปรึกษาช่วยเหลือจากผู้ใกล้ชิด";
        } else if (20 <= totalScore && totalScore <= 27) {
          sh_result ="ท่านมีอาการซึมเศร้าระดับรุนแรงมาก\n\nข้อแนะนำการดูแล\n\nต้องพบแพทย์เพื่อประเมินอาการและให้การรักษาโดยเร็ว ไม่ควรปล่อยทิ้งไว้";
        } else if (0 <= totalScore && totalScore <= 4) {
          sh_result = "ท่านไม่มีอาการซึมเศร้าหรือมีก็เพียงเล็กน้อย\n\nข้อแนะนำการดูแล\n\nไม่จำเป็นต้องรักษา";
        }
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResultPage(result: sh_result.toString())));
      }
      else {
        totalScore=totalScore+userAns;
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText()!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.indigo,
                  fontFamily: 'Mitr',
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.amber),
              child: Text(
                S.of(context)!.a4,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Mitr',
                ),
              ),
              onPressed: () {
                checkAnswer(3);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
              child:Text(
                S.of(context)!.a3,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Mitr',
                ),
              ),
              onPressed: () {
                checkAnswer(2);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.lime),
              child: Text(
                S.of(context)!.a2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Mitr',
                ),
              ),
              onPressed: () {
                checkAnswer(1);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
              child: Text(
                S.of(context)!.a1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Mitr',
                ),
              ),
              onPressed: () {
                checkAnswer(0);
              },
            ),
          ),
        ),
      ],
    );
  }
}
