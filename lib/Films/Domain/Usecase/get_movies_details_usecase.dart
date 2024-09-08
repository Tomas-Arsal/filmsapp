import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


import '../../../core/error/Failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../Entities/movie_entities.dart';
import '../Repository/base_movie_repository.dart';

class GetMoviesDetailsUseCase extends BaseUseCase<MovieDetail, MovieaDetailParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMoviesDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieaDetailParameters parameters) {
    return baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieaDetailParameters extends Equatable {
  final int movieId;

  const MovieaDetailParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}