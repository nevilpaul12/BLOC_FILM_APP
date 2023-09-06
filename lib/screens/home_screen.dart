import 'package:flutter/material.dart';
import 'package:tmdb_app/screens/now_playing_screen.dart';
import 'package:tmdb_app/screens/persons_screen.dart';
import 'package:tmdb_app/screens/top_rated_screen.dart';
import 'package:tmdb_app/screens/upcoming_movie_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: const Icon(Icons.menu,size: 25,color: Colors.black,),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Filmi pedia".toUpperCase(),style: const TextStyle(fontFamily: "Phudu",fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
      ),
       body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text("Now Playing Movies",style: const TextStyle(fontFamily: "Phudu",fontSize: 16,fontWeight: FontWeight.bold)),
            ),
            NowPlayingScreen(),
            SizedBox(height: 18,),
            
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Top Rated Movies".toUpperCase(),
                style: TextStyle(fontFamily: "Phudu",fontSize: 16,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8,),
            ConstrainedBox(
  constraints: BoxConstraints(maxHeight: 320), // Set a maximum height
  child: const TopRatedScreen(),
),
    SizedBox(height: 5,),
    Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: Text("Trening persons on this week",style: TextStyle(fontFamily: "Phudu",fontSize: 16,fontWeight: FontWeight.bold)),
    ),
    SizedBox(height: 10,),
    ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 100), // Set a maximum height
      child: const PersonsTrending(),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Upcoming Movies".toUpperCase(),
                style: TextStyle(fontFamily: "Phudu",fontSize: 16,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8,),
            ConstrainedBox(
  constraints: BoxConstraints(maxHeight: 320), // Set a maximum height
  child: const UpcomingMovieScreen(),),

      
          ],
          
        ),
      ),
    );
  }
}