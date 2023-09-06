import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/bloc/carousel_slider_bloc/bloc/now_playing_bloc.dart';
import 'package:tmdb_app/screens/movie_detail_screen.dart';

class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {

  NowPlayingBloc nowPlayingBloc = NowPlayingBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nowPlayingBloc.add(NowPlayingFetchEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc:nowPlayingBloc,
      builder: (context,state){
          switch(state.runtimeType){
            case NowPlayingLoadingState:
                return Center(
                  child: CircularProgressIndicator(),
                );
            case NowPlayingLoadedState:
                final successState = state as NowPlayingLoadedState;
                return Column(
                  children: [
                    SizedBox(height: 10,),
                    CarouselSlider.builder(
                      itemCount: successState.movies.length, 
                      itemBuilder: (context,index,realIndex){
                        final movie = successState.movies[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: GestureDetector(
                            onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context)=>MovieDetailScreen(movie: movie)));
                            },
                            child: Container(
                          
                              
                               height:
                                          MediaQuery.of(context).size.height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          
                              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/original/${movie.backdropPath}",),fit: BoxFit.cover,)),
                            
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 10),
                                  child: Text(movie.title.toUpperCase(),style: TextStyle(fontFamily: "Phudu",color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:5.0),
                                  child: Row(
                                    children: [
                                      
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Icon(Icons.star,color: Colors.yellow.shade700,size: 25,),
                                      ),
                                      Icon(Icons.star,color: Colors.yellow.shade700,size: 25,),
                                      Icon(Icons.star,color: Colors.yellow.shade700,size: 25,),
                                      Icon(Icons.star,color: Colors.yellow.shade700,size: 25,),
                                      Icon(Icons.star,color: Colors.yellow.shade700,size: 25,),
                                      SizedBox(width: 5,),
                                      Text(movie.voteAverage.toString(),style: TextStyle(color: Colors.white,fontFamily: "Phudu",fontSize: 15,fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            ),
                          ),
                        );
                      }, 
                      options: CarouselOptions(
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        enlargeCenterPage: true
                      )),
                  ],
                );
                default:
                    return const SizedBox();
          }
    }, listener: (context,state){});
  }
}