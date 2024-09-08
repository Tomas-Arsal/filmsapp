import 'package:dartz/dartz.dart';
import '../../../core/error/Failure.dart';
import '../../../core/error/exeptions.dart';
import '../../Domain/Entities/movie.dart';
import '../../Domain/Entities/movie_entities.dart';
import '../../Domain/Entities/recommendation.dart';
import '../../Domain/Repository/base_movie_repository.dart';
import '../../Domain/Usecase/get_movies_details_usecase.dart';
import '../../Domain/Usecase/get_recommendation_usecase.dart';
import '../DataSource/movie_remote_data_source.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }


  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async{
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    }
    on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRateMovies() async{
    final result = await baseMovieRemoteDataSource.getTopRateMovies();
    try {
      return Right(result);
    }
    on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieaDetailParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters) ;
    try {
      return Right(result);
    }
    on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    final result =
    await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
 }
