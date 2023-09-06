import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/bloc/upcoming_movies/bloc/upcoming_movies_bloc.dart';
import 'package:tmdb_app/screens/movie_detail_screen.dart';

class UpcomingMovieScreen extends StatefulWidget {
  const UpcomingMovieScreen({super.key});

  @override
  State<UpcomingMovieScreen> createState() => _UpcomingMovieScreenState();
}

class _UpcomingMovieScreenState extends State<UpcomingMovieScreen> {

  UpcomingMoviesBloc upcomingBloc = UpcomingMoviesBloc();

  

  String truncateText(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  }
  return text.substring(0, maxLength) + "...";
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upcomingBloc.add(UpcomingFetchEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: upcomingBloc,
        builder: (context,state){
            switch(state.runtimeType){
              case UpcomingMoviesLoadingState:
                  return Center(
                    child: CircularProgressIndicator(),
                  );

              case UpcomingMoviesLoadedState:
                final successState  = state as UpcomingMoviesLoadedState;
                 return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: successState.upcomingMovies.length,
                          itemBuilder: (context,index){
                            final movie = successState.upcomingMovies[index];
                                return Column(
                                  
                                  children: [
                                    
                                    Container(
                                      
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailScreen(movie: movie)));
                                                  },
                                                  child: Container(
                                                    height: 260,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/original/${movie.posterPath}",),fit: BoxFit.cover)
                                                    ),
                                                    
                                                      // child: Padding(
                                                      //   padding: const EdgeInsets.only(left: 8),
                                                      //   child: Image.network("https://image.tmdb.org/t/p/original/${movie.posterPath}",fit: BoxFit.cover,),
                                                      // ),
                                                  ),
                                                ),

                                                 SizedBox(height: 10,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 2),
                                                      child: Text(
                                                        
                                                        truncateText(movie.title, 25),
                                                      
                                                      style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Phudu"),),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
                                                        Icon(Icons.star,color: Colors.yellow.shade700,size: 20),
                                                        Icon(Icons.star,color: Colors.yellow.shade700,size: 20),
                                                        Icon(Icons.star,color: Colors.yellow.shade700,size: 20),
                                                        Icon(Icons.star,color: Colors.yellow.shade700,size: 20),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 2),
                                                          child: Text(movie.voteAverage.toString(),style: TextStyle(fontWeight: FontWeight.w500)),
                                                        ),
                                                      ],
                                                    )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                );
                        });
                        default:
                          return SizedBox();
            }
      }, listener: (context,state){}),
    );
  }
}