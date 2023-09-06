import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tmdb_app/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailScreen extends StatefulWidget {

  final MovieModel movie;
  const MovieDetailScreen({super.key,required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {


   String? youtubeVideoKey ;
   Future<String> getYoutubeKey(int id) async{

    final response =await http.get(Uri.parse("https://api.themoviedb.org/3/movie/${id}/videos?api_key=0bfece777156b75aec769ab945283d9d"));
   if (response.statusCode == 200) {
    List<dynamic> responseData = json.decode(response.body)["results"];
    List<String> youtubeKeys = responseData.map((item) {
      return item["key"].toString();
    }).toList();
    print(youtubeKeys);
    String firstKey = youtubeKeys[0];
    print(firstKey);

      setState(() {
        youtubeVideoKey = firstKey;
      });
    return firstKey;

    
    
  } else {
    throw Exception("Unable to find video keys");
  }
}

Future<void> _initializeYoutubePlayer() async {
  try {
    final videoKey = await getYoutubeKey(widget.movie.id);
    setState(() {
      youtubeVideoKey = videoKey;
      _controller = YoutubePlayerController(
        initialVideoId: youtubeVideoKey ?? "",
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          loop: false,
          enableCaption: true,
        ),
      );
    });
  } catch (e) {
    print("Error initializing Youtube player: $e");
  }
}


  

  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeYoutubePlayer();

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.black,
        child: Icon(Icons.favorite_sharp,color: Colors.red,size: 30,),
        onPressed: (){
            
      }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if(youtubeVideoKey != null)
                  Container(
                    
                    child: YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.yellow,), 
                        builder: (context,player){
                          return Column(
                            children: <Widget>[
                                player
                            ],
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        
                        padding: const EdgeInsets.only(top: 12),
                        
                        child: Container(
                          height: 250, 
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/original/${widget.movie.posterPath}"),fit: BoxFit.cover)
                          ),
                        )
                      ),

                      
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Text(widget.movie.title,style: TextStyle(fontFamily: "Phudu",fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star,color: Colors.yellow.shade800,),
                            Icon(Icons.star,color: Colors.yellow.shade800,),
                            Icon(Icons.star,color: Colors.yellow.shade800,),
                            Icon(Icons.star,color: Colors.yellow.shade800,),
                            Icon(Icons.star,color: Colors.yellow.shade800,),
                            
                          ],
                        ),
                        SizedBox(height: 15,),
                        
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 10),
                          child: Text(widget.movie.overview,style: TextStyle(fontFamily: "Phudu",fontSize: 15,fontWeight: FontWeight.w500),),
                        )
                      ],
                    ),
                  )
                  

                     
            ],
          ),
        ),
      ),
    );
  }
}