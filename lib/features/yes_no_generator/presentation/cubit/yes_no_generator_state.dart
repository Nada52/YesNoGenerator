part of 'yes_no_generator_cubit.dart';

abstract class YesNoGeneratorState extends Equatable {
  const YesNoGeneratorState();

  @override
  List<Object> get props => [];
}

class YesNoGeneratorInitial extends YesNoGeneratorState {}

class YesNoGeneratorLoading extends YesNoGeneratorState {}

class YesNoGeneratorLoaded extends YesNoGeneratorState {
  final YesNoEntity response;

  const YesNoGeneratorLoaded({required this.response});
}

class YesNoGeneratorFailure extends YesNoGeneratorState {
  final String errorMessage;

  const YesNoGeneratorFailure({required this.errorMessage});
}
