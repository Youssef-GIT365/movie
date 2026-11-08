import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/expention.dart';
import 'package:movie/core/errors/failur.dart';
import 'package:movie/movies/data/dataSource/movie_Rmote_data_source.dart';
import 'package:movie/movies/domain/entities/movie_Entitie.dart';
import 'package:movie/movies/domain/entities/movie_detailes.dart';
import 'package:movie/movies/domain/entities/recommendation.dart';
import 'package:movie/movies/domain/repo/base_movie_repo.dart';
import 'package:movie/movies/domain/usecases/get_Recommendation_usecase.dart';
import 'package:movie/movies/domain/usecases/get_movie_details.dart';

class MoviesRepositery extends BaseMovieRepo {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepositery({required this.baseMovieRemoteDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on serverexception catch (failur) {
      return left(serverFailure(failur.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRated() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on serverexception catch (failur) {
      return left(serverFailure(failur.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getpopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on serverexception catch (failur) {
      return left(serverFailure(failur.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, MovieDetailes>> getMovieDetails(
    MovieDetailsParemeters param,
  ) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(param);
    try {
      return Right(result);
    } on serverexception catch (failur) {
      return left(serverFailure(failur.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async {
    final result = await baseMovieRemoteDataSource.GetMovieRecommendation(parameters);
    try {
      return Right(result);
    } on serverexception catch (failur) {
      return left(serverFailure(failur.errorMessage.message));
    }
  }
}
