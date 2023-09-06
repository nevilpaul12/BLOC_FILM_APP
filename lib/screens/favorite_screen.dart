import 'package:flutter/material.dart';
import 'package:tmdb_app/repository/favorite_class.dart';

class FavoriteScreen extends StatefulWidget {

  final Favorites favorites;
  
   FavoriteScreen({super.key,required this.favorites});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Movies"),
      ),
      body: ListView.builder(
        itemCount: Favorites().favoriteMovies.length,
        itemBuilder: (context,index){
            final movie = Favorites().favoriteMovies[index];
            return ListTile(
              title: Text(movie.title),
              subtitle: Text(movie.overview),
            );
      }),
    );
  }
}