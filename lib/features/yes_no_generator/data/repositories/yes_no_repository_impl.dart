import 'package:dartz/dartz.dart';
import 'package:yes_no_generator/core/error/exceptions.dart';
import 'package:yes_no_generator/core/error/failures.dart';
import 'package:yes_no_generator/features/yes_no_generator/data/datasources/remote_data_source/remote_data_source.dart';
import 'package:yes_no_generator/features/yes_no_generator/domain/entities/yes_no_entity.dart';
import 'package:yes_no_generator/features/yes_no_generator/domain/repositories/yes_no_repository.dart';

class YesNoRepositoryImpl implements YesNoRepository {
  RemoteDataSource remoteDataSource;

  YesNoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, YesNoEntity>> generateYesOrNo() async {
    try {
      final response = await remoteDataSource.generateYesNo();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
