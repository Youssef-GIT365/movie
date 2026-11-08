import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/errors/failur.dart';
import 'package:movie/core/usecase/base_usecase.dart';
import 'package:movie/movies/domain/entities/recommendation.dart';
import 'package:movie/movies/domain/repo/base_movie_repo.dart';

class GetRecommendationUsecase
    extends
        BaseNoParametersUsecase<
          List<Recommendation>,
          RecommendationParameters
        > {
  final BaseMovieRepo baseMovieRepo;

  GetRecommendationUsecase({required this.baseMovieRepo});
  @override
  Future<Either<Failure, List<Recommendation>>> call(
    RecommendationParameters parameters,
  ) async {
   return  await baseMovieRepo.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
