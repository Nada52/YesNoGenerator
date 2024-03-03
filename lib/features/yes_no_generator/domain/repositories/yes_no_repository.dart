import 'package:dartz/dartz.dart';
import 'package:yes_no_generator/core/error/failures.dart';
import 'package:yes_no_generator/features/yes_no_generator/domain/entities/yes_no_entity.dart';

abstract class YesNoRepository {
  Future<Either<Failure, YesNoEntity>> generateYesOrNo();
}
