import 'dart:async';
import 'package:movie/core/utils/enemus.dart'; // تنبيه: تأكد من كتابة enums بشكل صحيح في مسار الملف لو واجهت مشكلة
import 'package:movie/movies/domain/usecases/get_NowPlaying_Movies_usecase.dart';
import 'package:movie/movies/domain/usecases/get_Recommendation_usecase.dart';
import 'package:movie/movies/domain/usecases/get_popular_Movies_usecase.dart';
import 'package:movie/movies/domain/usecases/get_TopRated_Movies_usecase.dart';
import 'package:movie/movies/presentation/components/movie_details_bloc.dart';
import 'package:movie/movies/presentation/controller/movies_event.dart';
import 'package:movie/movies/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowplayingMoviesUsecase getNowplayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;


  MoviesBloc(
    this.getNowplayingMoviesUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase, 
  ) : super( MoviesState()) { 
     on<getNowPlayinEvent>(_getNoPlayingMovies);
    on<getpopularEvent>(_getpopularMovies);
    on<getTopRatedEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNoPlayingMovies(
    getNowPlayinEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowplayingMoviesUsecase();

    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingmessage: l.Message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingState: RequestState.loaded,
          nowPlayingmovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getpopularMovies(
    getpopularEvent event,
    Emitter<MoviesState> emit,
  ) async {
    // ✅ تم التعديل لاستدعاء يوز كيس الـ Popular
    final result = await getPopularMoviesUsecase(); 
    
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularmessage: l.Message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularState: RequestState.loaded, 
          popularmovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
    getTopRatedEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRatedMoviesUsecase();
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedmessage: l.Message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedState: RequestState.loaded, 
          topRatedmovies: r,
        ),
      ),
    );
  }

    }