part of 'upcoming_movies_bloc.dart';

@immutable
sealed class UpcomingMoviesState {}

final class UpcomingMoviesInitial extends UpcomingMoviesState {}

final class UpcomingMoviesLoadingState extends UpcomingMoviesState{}

final class UpcomingMoviesLoadedState extends UpcomingMoviesState{

  final List<MovieModel> upcomingMovies;

  UpcomingMoviesLoadedState({required this.upcomingMovies});
}

final class UpcomingMoviesErrorState extends UpcomingMoviesState{}


