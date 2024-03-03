import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_no_generator/core/error/failures.dart';
import 'package:yes_no_generator/core/usecase/usecase.dart';
import 'package:yes_no_generator/features/yes_no_generator/domain/entities/yes_no_entity.dart';
import 'package:yes_no_generator/features/yes_no_generator/domain/usecases/get_random_yes_or_no.dart';

part 'yes_no_generator_state.dart';

class YesNoGeneratorCubit extends Cubit<YesNoGeneratorState> {
  YesNoGeneratorCubit({required this.getRandomYesOrNoUseCase})
      : super(YesNoGeneratorInitial());

  GetRandomYesOrNoUseCase getRandomYesOrNoUseCase;

  Future<void> generateYesOrNo() async {
    emit(YesNoGeneratorInitial());
    try {
      Either<Failure, YesNoEntity> response =
          await getRandomYesOrNoUseCase.call(NoParams);
      emit(response.fold(
          (failure) =>
              YesNoGeneratorFailure(errorMessage: mapFailureToMsg(failure)),
          (yesNoEntity) => YesNoGeneratorLoaded(response: yesNoEntity)));
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }

      // throw Exception(error.toString());
    }
  }

  String mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Error';

      default:
        return 'Unexpected Error';
    }
  }
}
