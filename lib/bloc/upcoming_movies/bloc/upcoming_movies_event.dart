part of 'upcoming_movies_bloc.dart';

@immutable
sealed class UpcomingMoviesEvent {}

class UpcomingFetchEvent extends UpcomingMoviesEvent{}
