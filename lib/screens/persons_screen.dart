import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/bloc/persons_bloc/bloc/persons_bloc.dart';

class PersonsTrending extends StatefulWidget {
  const PersonsTrending({super.key});

  @override
  State<PersonsTrending> createState() => _PersonsTrendingState();
}

class _PersonsTrendingState extends State<PersonsTrending> {

  PersonsBloc personsBloc = PersonsBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    personsBloc.add(PersonsFetchedEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: personsBloc,
        builder: (context,state){
            switch(state.runtimeType){
              case PersonsLoadingState:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case PersonsLoadedState:
                final successState = state as PersonsLoadedState;
                  return Container(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: successState.persons.length,
                      itemBuilder: (context,index){
                        final persons = successState.persons[index];
                          return Container(
                            child: Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                  ),
                                  elevation: 3,
                                  child: ClipRRect(
                                    child: Container(
                                      width: 80, 
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(100)),
                                        image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/w200/${persons.profilePath}"),fit: BoxFit.cover)
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                    }),
                  );
                  default:
                      return SizedBox();
            }
      }, listener: (context,state){}),
    );
  }
}