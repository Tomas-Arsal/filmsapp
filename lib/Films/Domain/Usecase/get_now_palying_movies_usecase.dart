import 'package:dartz/dartz.dart';
import '../../../core/error/Failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../Entities/movie.dart';
import '../Repository/base_movie_repository.dart';


class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
