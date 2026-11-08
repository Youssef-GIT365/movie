part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    required this.recommendation,
    required this.recommendationState,
    required this.recommendationMessage,
    this.movieDetailes,
    this.requestState = RequestState.loading,
    this.message = '',
  });

  final MovieDetailes? movieDetailes;
  final RequestState requestState;
  final String message;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetailes? movieDetailes,
    RequestState? requestState,
    String? message,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetailes: movieDetailes ?? this.movieDetailes,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
    movieDetailes,
    requestState,
    message,
    recommendation,
    recommendationState,
    recommendationMessage,
  ];
}
