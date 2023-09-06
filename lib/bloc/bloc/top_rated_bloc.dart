import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb_app/models/movie_model.dart';
import 'package:tmdb_app/repository/api_fetching.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  TopRatedBloc() : super(TopRatedInitial()) {
    on<TopratedFetchEvent>(topratedFetchEvent);
  }

  FutureOr<void> topratedFetchEvent(TopratedFetchEvent event, Emitter<TopRatedState> emit) async{

    emit(TopRatedLoadingState());

    final List<MovieModel> topMovies = await ApiFetching().getTrendingMovies();
    emit(TopRatedLoadedState(topMovies: topMovies));
    
  }
}
