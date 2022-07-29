import 'package:json_annotation/json_annotation.dart';

part 'question_single_choice.data.g.dart';

@JsonSerializable()
class QuestionSingleChoiceData {
  late final String type;
  late final String question;
  late final List<String> answers;
  late final int correctAnswer;
  int? userAnswer;

  QuestionSingleChoiceData({
    required this.type,
    required this.question,
    required this.answers,
    required this.correctAnswer,
    this.userAnswer
  });

  factory QuestionSingleChoiceData.fromJson(Map<String, dynamic> json) =>
      _$QuestionSingleChoiceDataFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionSingleChoiceDataToJson(this);
}