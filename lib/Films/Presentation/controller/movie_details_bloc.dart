import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../core/utils/enums.dart';
import '../../Domain/Entities/movie_entities.dart';
import '../../Domain/Entities/recommendation.dart';
import '../../Domain/Usecase/get_movies_details_usecase.dart';
import '../../Domain/Usecase/get_recommendation_usecase.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase , this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendationEvent);

  }

  final GetMoviesDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;


  FutureOr<void> _getMovieDetails(
      GetMovieDetailEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(MovieaDetailParameters(
      movieId: event.id,
    ));

    result.fold(
          (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.message,
      )),
          (r) => emit(
        state.copyWith(
          movieDetail: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }
  FutureOr<void> _getMovieRecommendationEvent (
      GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit)async {
    final result = await getRecommendationUseCase(
      RecommendationParameters(
        event.id,
      ),
    );

    result.fold(
          (l) => emit(state.copyWith(
        recommendationState: RequestState.error,
        recommendationMessage: l.message,
      )),
          (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequestState.loaded,
        ),
      ),
    );
  }
  }

