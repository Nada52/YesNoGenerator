import 'package:equatable/equatable.dart';

class YesNoEntity extends Equatable {
  final String answer;
  final bool forced;
  final String image;

  const YesNoEntity({required this.answer, required this.forced, required this.image});
  @override
  List<Object?> get props => [answer, forced, image];
}
