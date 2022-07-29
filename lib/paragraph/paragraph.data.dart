import 'package:json_annotation/json_annotation.dart';

part 'paragraph.data.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class ParagraphData {
  late final String type;
  late final String data;

  ParagraphData({required this.type, required this.data});

  factory ParagraphData.fromJson(Map<String, dynamic> json) =>
      _$ParagraphDataFromJson(json);

  Map<String, dynamic> toJson() => _$ParagraphDataToJson(this);
}