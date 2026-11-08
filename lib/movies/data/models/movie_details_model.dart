import 'package:movie/movies/data/models/genres_model.dart';
import 'package:movie/movies/domain/entities/movie_detailes.dart';

class MovieDetailsModel extends MovieDetailes {
  MovieDetailsModel({
    required super.backdrop_path,
    required super.title,
    required super.id,
    required super.voteAverage,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.genres,
  });
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdrop_path: json["backdrop_path"],
        title: json["title"],
        id: json["id"],
        voteAverage: (json['vote_average'] as num).toDouble(),
        overview: json["overview"],
        releaseDate: json["release_date"],
        runtime: json["runtime"],
        genres: List<GenresModel>.from(
          (json['genres'] as List).map((x) => GenresModel.fromJson(x)),
        ),
      );
}
