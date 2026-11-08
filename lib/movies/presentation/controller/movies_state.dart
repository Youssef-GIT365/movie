import 'package:equatable/equatable.dart';
import 'package:movie/core/utils/enemus.dart';
import 'package:movie/movies/domain/entities/movie_Entitie.dart';

class MoviesState extends Equatable {
  final List<MovieEntity> nowPlayingmovies;
  final RequestState nowPlayingState;
  final String nowPlayingmessage;
  final List<MovieEntity> popularmovies;
  final RequestState popularState;
  final String popularmessage;
  final List<MovieEntity> topRatedmovies;
  final RequestState topRatedState;
  final String topRatedmessage;
  MoviesState({
    this.nowPlayingmovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingmessage = '',
    this.popularmovies = const [],
    this.popularState = RequestState.loading,
    this.popularmessage = '',
    this.topRatedmovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedmessage = '',
  });
  MoviesState copyWith({
    final List<MovieEntity>? nowPlayingmovies,
    RequestState? nowPlayingState,
    String? nowPlayingmessage,
    List<MovieEntity>? popularmovies,
    RequestState? popularState,
    String? popularmessage,
    List<MovieEntity>? topRatedmovies,
    RequestState? topRatedState,
    String? topRatedmessage,
  }) {
    return MoviesState(
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingmessage: nowPlayingmessage ?? this.nowPlayingmessage,
      nowPlayingmovies: nowPlayingmovies ?? this.nowPlayingmovies,
      popularState: popularState ?? this.popularState,
      popularmessage: popularmessage ?? this.popularmessage,
      popularmovies: popularmovies ?? this.popularmovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedmessage: topRatedmessage ?? this.topRatedmessage,
      topRatedmovies: topRatedmovies ?? this.topRatedmovies,
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingmovies,
    nowPlayingState,
    nowPlayingmessage,
    popularmovies,
    popularState,
    popularmessage,
    topRatedmovies,
    topRatedState,
    topRatedmessage,
  ];
}
