part of 'now_playing_bloc.dart';

@immutable
sealed class NowPlayingState {}

sealed class NowPlayingActionState extends NowPlayingState{}

final class NowPlayingInitial extends NowPlayingState {}

final class NowPlayingLoadingState extends NowPlayingState{}

final class NowPlayingLoadedState extends NowPlayingState{

  final List<MovieModel> movies;

  NowPlayingLoadedState({required this.movies});

}
