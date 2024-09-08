import 'package:dio/dio.dart';

import '../../../core/error/exeptions.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_message_model.dart';
import '../../Domain/Entities/movie_entities.dart';
import '../../Domain/Usecase/get_movies_details_usecase.dart';
import '../../Domain/Usecase/get_recommendation_usecase.dart';
import '../models/details_movie_model.dart';
import '../models/movie_model.dart';
import '../models/recommendation_model.dart';
abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() ;
   Future<List<MovieModel>> getPopularMovies() ;
   Future<List<MovieModel>> getTopRateMovies() ;
  Future<MovieDetail> getMovieDetails(MovieaDetailParameters parameters) ;
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
            (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
            (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }


  @override
  Future<List<MovieModel>> getTopRateMovies() async{
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }  }

  @override
  Future<MovieDetail> getMovieDetails(MovieaDetailParameters parameters) async {
    final response = await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response =
    await Dio().get(ApiConstance.recommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
          (response.data["results"] as List).map(
                (e) => RecommendationModel.fromJson(e),
          ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}

