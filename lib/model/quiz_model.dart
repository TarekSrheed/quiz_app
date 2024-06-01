// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuizModel {
  String question;
  List<String> answers;
  num indexOfCorrectAnswer;
 
  QuizModel({
    required this.question,
    required this.answers,
    required this.indexOfCorrectAnswer,
   
  });



  QuizModel copyWith({
    String? question,
    List<String>? answers,
    num? indexOfCorrectAnswer,
  }) {
    return QuizModel(
      question: question ?? this.question,
      answers: answers ?? this.answers,
      indexOfCorrectAnswer: indexOfCorrectAnswer ?? this.indexOfCorrectAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answers': answers,
      'indexOfCorrectAnswer': indexOfCorrectAnswer,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      question: map['question'] as String,
      answers:  List.generate(
        map['answers'].length,
        (index) => map['answers'][index],
      ),
      indexOfCorrectAnswer: map['indexOfCorrectAnswer'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuizModel(question: $question, answers: $answers, indexOfCorrectAnswer: $indexOfCorrectAnswer)';

  @override
  bool operator ==(covariant QuizModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.question == question &&
      listEquals(other.answers, answers) &&
      other.indexOfCorrectAnswer == indexOfCorrectAnswer;
  }

  @override
  int get hashCode => question.hashCode ^ answers.hashCode ^ indexOfCorrectAnswer.hashCode;
}
