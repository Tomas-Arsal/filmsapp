import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../core/usecase/base_usecase.dart';
import '../../../core/utils/enums.dart';
import '../../Domain/Usecase/get_now_palying_movies_usecase.dart';
import '../../Domain/Usecase/get_popular_movies_usecase.dart';
import '../../Domain/Usecase/get_top_rate_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  final GetTopRateMoviesUsecase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase,
      this.getTopRatedMoviesUseCase,
      this.getPopularMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesEvent);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event,
      Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
          (l) =>
          emit(state.copyWith(
            nowPlayingState: RequestState.error,
            popularMessage: l.message,
          )),
          (r) =>
          emit(
            state.copyWith(
              nowPlayingMovies: r,
              nowPlayingState: RequestState.loaded,
            ),
          ),
    );
  }

  FutureOr<void> _getTopRatedMoviesEvent(GetTopRatedMoviesEvent event,
      Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
          (l) =>
          emit(state.copyWith(
            topRatedMessage: l.message,
            topRatedState: RequestState.error,
          )),
          (r) =>
          emit(
            state.copyWith(
              topRatedMovies: r,
              topRatedState: RequestState.loaded,
            ),
          ),
    );
  }


FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event,
    Emitter<MoviesState> emit) async {
  final result = await getPopularMoviesUseCase(const NoParameters());

  result.fold(
        (l) =>
        emit(
          state.copyWith(
            popularState: RequestState.error,
            popularMessage: l.message,
          ),
        ),
        (r) =>
        emit(
          state.copyWith(
            popularMovies: r,
            popularState: RequestState.loaded,
          ),
        ),
  );
}}
