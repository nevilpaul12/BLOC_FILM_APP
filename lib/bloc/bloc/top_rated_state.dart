part of 'top_rated_bloc.dart';

@immutable
sealed class TopRatedState {}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoadingState extends TopRatedState{}

final class TopRatedLoadedState extends TopRatedState{
  final List<MovieModel> topMovies;

  TopRatedLoadedState({required this.topMovies});
  
}

final class TopratedErrorState extends TopRatedState{}
