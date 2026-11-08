import 'package:movie/movies/domain/entities/recommendation.dart';

class RecommendatioModel extends Recommendation {
  RecommendatioModel({required super.backdropPath, required super.id});
  factory RecommendatioModel.fromJson(Map<String, dynamic> json) =>
      RecommendatioModel(backdropPath: json['backdrop_path'], id: json['id']);
}
