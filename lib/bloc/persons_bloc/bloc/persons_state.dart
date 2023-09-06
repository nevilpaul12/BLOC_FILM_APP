part of 'persons_bloc.dart';


@immutable
sealed class PersonsState {}

final class PersonsInitial extends PersonsState {}

final class PersonsLoadingState extends PersonsState{}

final class PersonsLoadedState extends PersonsState{

   final List<PersonModel> persons;

  PersonsLoadedState({required this.persons});

   
}

final class PersonsErrorState extends PersonsState{}
