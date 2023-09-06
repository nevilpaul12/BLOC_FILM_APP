part of 'persons_bloc.dart';

@immutable
sealed class PersonsEvent {}

class PersonsFetchedEvent extends PersonsEvent{}
