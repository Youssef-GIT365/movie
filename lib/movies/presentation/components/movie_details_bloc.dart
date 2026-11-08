import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/enemus.dart';
import 'package:movie/movies/domain/entities/movie_detailes.dart';
import 'package:movie/movies/domain/entities/recommendation.dart';
import 'package:movie/movies/domain/usecases/get_movie_details.dart';
import 'package:movie/movies/domain/usecases/get_Recommendation_usecase.dart';

import 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;
  final GetRecommendationUsecase getRecommendationUsecase;

  MovieDetailsBloc(this.getMovieDetails, this.getRecommendationUsecase)
      : super(const MovieDetailsState(
          recommendation: [],
          recommendationState: RequestState.loading,
          recommendationMessage: '',
        )) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieDetails(
      MovieDetailsParemeters(MovieId: event.id),
    );
    result.fold(
      (l) => emit(
        state.copyWith(
          requestState: RequestState.error,
          message: l.Message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetailes: r,
          requestState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendation(
    GetMovieRecommendationEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getRecommendationUsecase(
      RecommendationParameters(event.id),
    );
    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.Message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequestState.loaded,
        ),
      ),
    );
  }
}