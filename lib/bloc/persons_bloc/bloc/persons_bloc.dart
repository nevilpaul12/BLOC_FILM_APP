import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb_app/models/person_model.dart';
import 'package:tmdb_app/repository/api_fetching.dart';

part 'persons_event.dart';
part 'persons_state.dart';

class PersonsBloc extends Bloc<PersonsEvent, PersonsState> {
  PersonsBloc() : super(PersonsInitial()) {
    on<PersonsFetchedEvent>(personsFetchedEvent);
  }

  FutureOr<void> personsFetchedEvent(PersonsFetchedEvent event, Emitter<PersonsState> emit) async{


    emit(PersonsLoadingState());

    List<PersonModel> persons = await ApiFetching().getTrendingPersons();
    emit(PersonsLoadedState(persons:persons));
  }
}
