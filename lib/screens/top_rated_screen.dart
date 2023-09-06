import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/bloc/bloc/top_rated_bloc.dart';
import 'package:tmdb_app/screens/movie_detail_screen.dart';

class TopRatedScreen extends StatefulWidget {
  const TopRatedScreen({super.key});

  @override
  State<TopRatedScreen> createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen> {

  TopRatedBloc topRatedBloc = TopRatedBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topRatedBloc.add(TopratedFetchEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer(
          bloc: topRatedBloc,
          builder: (context,state){
              switch(state.runtimeType){
                case TopRatedLoadingState:
                    return Center(
                        child: CircularProgressIndicator(),
                    );
                  case TopRatedLoadedState:
                        final successState = state as TopRatedLoadedState;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: successState.topMovies.length,
                          itemBuilder: (context,index){
                            final movie = successState.topMovies[index];
                                return SingleChildScrollView(
                                  child: Column(
                                    
                                    children: [
                                      
                                      SingleChildScrollView(
                                        child: Container(
                                          
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
                                                      child: Text(movie.title,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
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
                                        ),
                                      )
                                    ],
                                  ),
                                );
                        });
                        default:
                            return SizedBox();
              }
        }, listener: (context,state){

        }),
    );
  }
}