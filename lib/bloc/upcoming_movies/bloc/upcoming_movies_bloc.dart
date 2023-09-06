import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb_app/models/movie_model.dart';
import 'package:tmdb_app/repository/api_fetching.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  UpcomingMoviesBloc() : super(UpcomingMoviesInitial()) {
    on<UpcomingFetchEvent>(upcomingFetchEvent);
  }

  FutureOr<void> upcomingFetchEvent(UpcomingFetchEvent event, Emitter<UpcomingMoviesState> emit) async{

    emit(UpcomingMoviesLoadingState());

    List<MovieModel> upcomingMovies = await ApiFetching().getUpcomingMovies();
    emit(UpcomingMoviesLoadedState(upcomingMovies: upcomingMovies));

  }
}
