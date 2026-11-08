import 'package:get_it/get_it.dart';
import 'package:movie/movies/data/dataSource/movie_Rmote_data_source.dart';
import 'package:movie/movies/data/repo/movies_repositery.dart';
import 'package:movie/movies/domain/repo/base_movie_repo.dart';
import 'package:movie/movies/domain/usecases/get_NowPlaying_Movies_usecase.dart';
import 'package:movie/movies/domain/usecases/get_TopRated_Movies_usecase.dart';
import 'package:movie/movies/domain/usecases/get_movie_details.dart';
import 'package:movie/movies/domain/usecases/get_popular_Movies_usecase.dart';
import 'package:movie/movies/domain/usecases/get_Recommendation_usecase.dart'; // ✅ أضفنا الـ import ده
import 'package:movie/movies/presentation/components/movie_details_bloc.dart';
import 'package:movie/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLoctor {
  void init() {
    /// Blocs
    // الـ MoviesBloc بياخد NowPlaying, Popular, TopRated, وقفلنا الـ Recommendation منه في الخطوة اللي فاتت
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

     sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    /// Use cases
    sl.registerLazySingleton(
      () => GetNowplayingMoviesUsecase(baseMovieRepo: sl()),
    );
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetails(baseMovieRepo: sl()));
    sl.registerLazySingleton(
      () => GetTopRatedMoviesUsecase(baseMovieRepo: sl()),
    );
    // ✅ السطر السحري اللي كان ناقص وموقف التطبيق!
    sl.registerLazySingleton(
      () => GetRecommendationUsecase(baseMovieRepo: sl()),
    );

    /// Repository
    sl.registerLazySingleton<BaseMovieRepo>(
      () => MoviesRepositery(baseMovieRemoteDataSource: sl()),
    );

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
  }
}
