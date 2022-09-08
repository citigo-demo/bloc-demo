import 'dart:convert';

import 'package:bloc_demo/repository/models/genre.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/game.dart';
import '../models/result.dart';
import '../models/result_error.dart';

class GameService {
  GameService(
      {http.Client? httpClient, this.baseUrl = "http://api.rawg.io/api"})
      : _httpClient = httpClient ?? http.Client();
  final String baseUrl;
  final http.Client _httpClient;

  Uri getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {
    try{
      final queryParameters = <String, String>{
        'key': dotenv.get('GAMES_API_KEY'),
      };
      if (extraParameters != null) {
        queryParameters.addAll(extraParameters);
      }
      return Uri.parse('$baseUrl/$url').replace(queryParameters: queryParameters);
    }catch(error){
      return Uri.parse('');
    }
  }

  Future<Game> getGames() async {
    print('call get game');
    final response = await _httpClient.get(getUrl(url: 'games'));

    print('get game res:${response.statusCode}');

    if (response.statusCode == 200) {
      print('game data:${response.body}');
      if (response.body.isNotEmpty) {
        print('data body:${response.body.length}');
        return Game.fromJson(json.decode(response.body));
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingGames('Error getting games');
    }
  }

  Future<List<Genre>> getGenres() async {
    final response = await _httpClient.get(getUrl(url: 'genres'));

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return List<Genre>.from(json
            .decode(response.body)['results']
            .map((data) => Genre.fromJson(data)));
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingGames('Error getting genres');
    }
  }

  Future<List<Result>> getGameByCategory(int genreId) async {
    final response = await _httpClient.get(
        getUrl(url: 'games', extraParameters: {'genres': genreId.toString()}));

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return List<Result>.from(json
            .decode(response.body)['results']
            .map((data) => Result.fromJson(data)));
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingGames('Error getting games');
    }
  }
}
