// ignore_for_file: overridden_fields

import 'package:yes_no_generator/features/yes_no_generator/domain/entities/yes_no_entity.dart';

class YesNoModel extends YesNoEntity {

  @override
  final String answer;
  @override
  final bool forced;
  @override
  final String image;
  const YesNoModel(
      {required this.answer, required this.forced, required this.image})
      : super(answer: answer, forced: forced, image: image);

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
      answer: json['answer'], forced: json['forced'], image: json['image']);

  Map<String, dynamic> toJson() => {
        'answer': answer,
        'forced': forced,
        'image': image,
      };
}
