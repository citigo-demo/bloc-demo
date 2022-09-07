import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/game.dart';
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
    final queryParameters = <String, String>{
      'key': dotenv.get('GAMES_API_KEY'),
    };
    if (extraParameters != null) {
      queryParameters.addAll(extraParameters);
    }
    return Uri.parse('$baseUrl/$url').replace(queryParameters: queryParameters);
  }

  Future<Game> getGames() async{
    final response = await _httpClient.get(getUrl(url: 'games'));

    if(response.statusCode == 200){
      if(response.body.isNotEmpty){
        return Game.fromJson(json.decode(response.body));
      }else{
        throw ErrorEmptyResponse();
      }
    }else{
      throw ErrorGettingGames('Error getting games');
    }
  }
}
