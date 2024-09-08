import 'package:dartz/dartz.dart';
import '../../../core/error/Failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../Entities/movie.dart';
import '../Repository/base_movie_repository.dart';

class GetTopRateMoviesUsecase extends BaseUseCase<List<Movie> , NoParameters>{
  final BaseMovieRepository baseMovieRepository ;

  GetTopRateMoviesUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await  baseMovieRepository.getTopRateMovies();
  }

}

