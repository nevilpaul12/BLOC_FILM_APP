import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmdb_app/models/movie_model.dart';
import 'package:tmdb_app/models/person_model.dart';

class ApiFetching{

  Future<List<MovieModel>> getNowPlayingMovies() async{

    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/now_playing?api_key=0bfece777156b75aec769ab945283d9d"));
    if(response.statusCode == 200){
      final List<dynamic> responseData = json.decode(response.body)['results'];
      final data = responseData.map((json) => MovieModel.fromJson(json)).toList();
      return data;
    }else{
      throw Exception("Api Fetching Error");
    }
  }

  
  Future<List<MovieModel>> getTrendingMovies() async{

    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=0bfece777156b75aec769ab945283d9d"));
    if(response.statusCode == 200){
      final List<dynamic> responseData = json.decode(response.body)['results'];
      final data = responseData.map((json) => MovieModel.fromJson(json)).toList();
      return data;
    }else{
      throw Exception("Api Top Rated Error");
    }
  }

  Future<List<MovieModel>> getUpcomingMovies() async{

    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/upcoming?api_key=0bfece777156b75aec769ab945283d9d"));
    if(response.statusCode == 200){
      final List<dynamic> responseData = json.decode(response.body)['results'];
      final data = responseData.map((json) => MovieModel.fromJson(json)).toList();
      return data;
    }else{
      throw Exception("Api Upcoming Error");
    }
  }


  Future<List<PersonModel>> getTrendingPersons() async{

    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/trending/person/day?api_key=0bfece777156b75aec769ab945283d9d"));
    if(response.statusCode == 200){
      final List<dynamic> responseData = json.decode(response.body)['results'];
      final persons = responseData.map((json) => PersonModel.fromJson(json)).toList();
      return persons;
    }else{
      throw Exception("Trending Persons Api Error");
    }
  }
}