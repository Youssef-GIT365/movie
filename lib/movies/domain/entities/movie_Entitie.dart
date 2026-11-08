import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final double voteAverage;
  final String overView;
  final List<int> genIds;
  final String releaseDate;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.voteAverage,
    required this.overView,
    required this.genIds,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [
    id,
    title,
    backdropPath,
    voteAverage,
    overView,
    genIds,
    releaseDate,
  ];
}
