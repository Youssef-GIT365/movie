import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/failur.dart' show Failure;
import 'package:movie/core/usecase/base_usecase.dart';
import 'package:movie/movies/domain/entities/movie_Entitie.dart';
import 'package:movie/movies/domain/repo/base_movie_repo.dart';

class GetPopularMoviesUsecase extends BaseUsecase<List<MovieEntity>> {
   final BaseMovieRepo baseMovieRepo;

  GetPopularMoviesUsecase(this.baseMovieRepo);
   
  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await baseMovieRepo.getpopularMovies();
  }
  
  
}