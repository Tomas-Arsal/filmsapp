part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

 class GetMovieDetailEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailEvent(this.id);

  @override
  List<Object> get props => [];
}

class GetMovieRecommendationEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieRecommendationEvent(this.id);

  @override
  List<Object> get props => [id];
}
