import 'package:dartz/dartz.dart';
import 'package:yes_no_generator/core/error/failures.dart';
import 'package:yes_no_generator/core/usecase/usecase.dart';
import 'package:yes_no_generator/features/yes_no_generator/domain/entities/yes_no_entity.dart';
import 'package:yes_no_generator/features/yes_no_generator/domain/repositories/yes_no_repository.dart';

class GetRandomYesOrNoUseCase extends UseCase {
  YesNoRepository yesNoRepository;
  GetRandomYesOrNoUseCase({required this.yesNoRepository});

  @override
  Future<Either<Failure, YesNoEntity>> call(params) {
    return yesNoRepository.generateYesOrNo();
  }
}
