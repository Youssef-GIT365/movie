import 'package:dio/dio.dart';
import 'package:movie/core/api/api_key.dart';
import 'package:movie/core/errors/error_message.dart';
import 'package:movie/core/errors/expention.dart';
import 'package:movie/movies/data/models/Recommendatio_model.dart';
import 'package:movie/movies/data/models/movie_Model.dart';
import 'package:movie/movies/data/models/movie_details_model.dart';
import 'package:movie/movies/domain/entities/recommendation.dart';
import 'package:movie/movies/domain/usecases/get_Recommendation_usecase.dart';
import 'package:movie/movies/domain/usecases/get_movie_details.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<Recommendation>> GetMovieRecommendation(
    RecommendationParameters parameters,
  );
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParemeters param);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get("$nowPlayingMoviePath");
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw serverexception(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get("$popularMoviePath");
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw serverexception(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get("$TopRatedMoviePath");
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw serverexception(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
    MovieDetailsParemeters param,
  ) async {
    final response = await Dio().get(ApiConstance.MovieDetails(param.MovieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw serverexception(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<List<Recommendation>> GetMovieRecommendation(
    RecommendationParameters parameters,
  ) async {
    final response = await Dio().get(
      "${ApiConstance.recomdation(parameters.id)}",
    );
    if (response.statusCode == 200) {
      return List<RecommendatioModel>.from(
        (response.data["results"] as List).map(
          (e) => RecommendatioModel.fromJson(e),
        ),
      );
    } else {
      throw serverexception(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }
}
