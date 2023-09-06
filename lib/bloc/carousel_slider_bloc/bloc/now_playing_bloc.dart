import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb_app/models/movie_model.dart';
import 'package:tmdb_app/repository/api_fetching.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingBloc() : super(NowPlayingInitial()) {
    on<NowPlayingFetchEvent>(nowPlayingFetchEvent);
  }

  FutureOr<void> nowPlayingFetchEvent(NowPlayingFetchEvent event, Emitter<NowPlayingState> emit) async{
    emit(NowPlayingLoadingState());

    List<MovieModel> movies = await ApiFetching().getNowPlayingMovies();
    emit(NowPlayingLoadedState(movies: movies));
    
  }
}
