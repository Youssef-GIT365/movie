import 'package:movie/movies/domain/entities/movie_Entitie.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.voteAverage,
    required super.overView,
    required super.genIds,
    required super.releaseDate,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    id: json["id"],
    title: json["title"],
    backdropPath: json["backdrop_path"],
    voteAverage: (json["vote_average"] as num).toDouble(),
    overView: json["overview"],
    genIds: List<int>.from(json["genre_ids"].map((e) => e)),
    releaseDate: json["release_date"],
  );
}
