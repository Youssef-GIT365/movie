import 'package:equatable/equatable.dart';
import 'package:movie/movies/domain/entities/genres.dart';

class MovieDetailes extends Equatable {
  final String backdrop_path;
  final String title;
  final List<Genres> genres;
  final int id;
  final double voteAverage;
  final String overview;
  final String releaseDate;
  final int runtime;

  MovieDetailes({
    required this.backdrop_path,
    required this.title,
    required this.id,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
  });
  List<Object?> get props => [
    backdrop_path,
    title,
    id,
    voteAverage,
    overview,
    releaseDate,
    runtime,
    genres,
  ];
}
