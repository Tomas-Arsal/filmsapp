import 'package:dartz/dartz.dart';
import '../../../core/error/Failure.dart';
import '../Entities/movie.dart';
import '../Entities/movie_entities.dart';
import '../Entities/recommendation.dart';
import '../Usecase/get_movies_details_usecase.dart';
import '../Usecase/get_recommendation_usecase.dart';

abstract class BaseMovieRepository
{
   Future<Either<Failure, List<Movie>>> getNowPlayingMovies() ;
   Future<Either<Failure, List<Movie>>> getPopularMovies();
    Future<Either<Failure, List<Movie>>> getTopRateMovies() ;
   Future<Either<Failure, MovieDetail>> getMovieDetails(MovieaDetailParameters parameters) ;
   Future<Either<Failure, List<Recommendation>>> getRecommendation(
       RecommendationParameters parameters);
}
