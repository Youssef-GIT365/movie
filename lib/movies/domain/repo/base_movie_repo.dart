import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failur.dart';
import 'package:movie/movies/domain/entities/movie_Entitie.dart';
import 'package:movie/movies/domain/entities/movie_detailes.dart';
import 'package:movie/movies/domain/entities/recommendation.dart';
import 'package:movie/movies/domain/usecases/get_Recommendation_usecase.dart';
import 'package:movie/movies/domain/usecases/get_movie_details.dart';

abstract class BaseMovieRepo {
  Future<Either<Failure, List<MovieEntity>>> getNowPlaying();
  Future<Either<Failure, List<MovieEntity>>> getpopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRated();
  Future<Either<Failure, MovieDetailes>> getMovieDetails(
    MovieDetailsParemeters param,
  );
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
    RecommendationParameters parameters,
  );
}
