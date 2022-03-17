import 'question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank=[
    Question(q: 'เบื่อ ทำอะไร ๆ ก็ไม่เพลิดเพลิน\n\nLittle interest or pleasure in doing things'),
    Question(q: "ไม่สบายใจ ซึมเศร้า หรือท้อแท้\n\nFeeling down, depressed, or hopeless"),
    Question(q: "หลับยาก หรือหลับ ๆ ตื่น ๆ หรือหลับมากไป\n\nTrouble falling or staying asleep, or sleeping too much"),
    Question(q: "เหนื่อยง่าย หรือไม่ค่อยมีแรง\n\nFeeling tired or having little energy"),
    Question(q: "เบื่ออาหาร หรือกินมากเกินไป\n\nPoor appetite or overeating"),
    Question(q: "รู้สึกไม่ดีกับตัวเอง คิดว่าตัวเองล้มเหลว หรือเป็นคนทำให้ตัวเอง หรือครอบครัวผิดหวัง\n\nFeeling bad about yourself - or that you are a failure or have let yourself or your family down"),
    Question(q: "สมาธิไม่ดีเวลาทำอะไร เช่น ดูโทรทัศน์ ฟังวิทยุ หรือทำงานที่ต้องใช้ความตั้งใจ\n\nTrouble concentrating on things, such as reading the newspaper or watching television"),
    Question(q: "พูดหรือทำอะไรช้าจนคนอื่นมองเห็น หรือกระสับกระส่ายจนท่านอยู่ไม่นิ่งเหมือนเคย\n\nMoving or speaking so slowly that other people could have noticed\nOr the opposite - being so fidgety or restless that you have been moving around a lot more than usual"),
    Question(q: "คิดทำร้ายตนเอง หรือคิดว่าถ้าตาย ๆ ไปเสียคงจะดี\n\nFeeling down, depressed, or hopeless Thoughts that you would be better off dead, or of hurting yourself"),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length-1) {
      _questionNumber++;
    }
  }

  String? getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }


  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

}