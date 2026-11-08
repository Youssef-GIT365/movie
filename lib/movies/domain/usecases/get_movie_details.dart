import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/errors/failur.dart';
import 'package:movie/core/usecase/base_usecase.dart';
import 'package:movie/movies/domain/entities/movie_detailes.dart';
import 'package:movie/movies/domain/repo/base_movie_repo.dart';

class GetMovieDetails
    extends BaseNoParametersUsecase<MovieDetailes, MovieDetailsParemeters> {
  final BaseMovieRepo baseMovieRepo;

  GetMovieDetails({required this.baseMovieRepo});
  @override
  Future<Either<Failure, MovieDetailes>> call(
    MovieDetailsParemeters paremeter,
  ) async {
    return await baseMovieRepo.getMovieDetails(paremeter);
  }
}

class MovieDetailsParemeters extends Equatable {
  final int MovieId;

  MovieDetailsParemeters({required this.MovieId});

  @override
  // TODO: implement props
  List<Object?> get props => [MovieId];
}
