
import 'package:get_it/get_it.dart';
import '../../Films/Data/DataSource/movie_remote_data_source.dart';
import '../../Films/Data/Repository/Movies_Repository.dart';
import '../../Films/Domain/Repository/base_movie_repository.dart';
import '../../Films/Domain/Usecase/get_movies_details_usecase.dart';
import '../../Films/Domain/Usecase/get_now_palying_movies_usecase.dart';
import '../../Films/Domain/Usecase/get_popular_movies_usecase.dart';
import '../../Films/Domain/Usecase/get_recommendation_usecase.dart';
import '../../Films/Domain/Usecase/get_top_rate_movies_usecase.dart';
import '../../Films/Presentation/controller/movie_details_bloc.dart';
import '../../Films/Presentation/controller/movies_Bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // registerFactory do for rebuild the variable when user click screen
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl() , sl() , sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl() , sl()));


    /// Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    /// UseCase
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRateMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

  }
}
