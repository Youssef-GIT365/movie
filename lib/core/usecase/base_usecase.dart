import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failur.dart';

abstract class BaseUsecase<T> {
  Future<Either<Failure, T>> call();
}

abstract class BaseNoParametersUsecase<T, parameters> {
  Future<Either<Failure, T>> call(parameters parameter);
}
