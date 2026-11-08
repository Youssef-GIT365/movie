const baseUrl = "https://api.themoviedb.org/3";
const apiKey = '7ce439456e766df07ee434c10aa3b346';
const nowPlayingMoviePath = '$baseUrl/movie/now_playing?api_key=$apiKey';
const popularMoviePath = '$baseUrl/movie/popular?api_key=$apiKey';
const TopRatedMoviePath = '$baseUrl/movie/top_rated?api_key=$apiKey';


class ApiConstance {
  static String imageUrl(String Path) => '${baseImageUrl}$Path';
  static String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static MovieDetails(int movieId) => '$baseUrl/movie/$movieId?api_key=$apiKey';
  static recomdation(int movieId) => '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';
}
