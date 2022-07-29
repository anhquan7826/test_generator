// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_single_choice.data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionSingleChoiceData _$QuestionSingleChoiceDataFromJson(
        Map<String, dynamic> json) =>
    QuestionSingleChoiceData(
      type: json['type'] as String,
      question: json['question'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      correctAnswer: json['correctAnswer'] as int,
      userAnswer: json['userAnswer'] as int?,
    );

Map<String, dynamic> _$QuestionSingleChoiceDataToJson(
        QuestionSingleChoiceData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'question': instance.question,
      'answers': instance.answers,
      'correctAnswer': instance.correctAnswer,
      'userAnswer': instance.userAnswer,
    };
