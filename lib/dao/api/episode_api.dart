import 'dart:convert';

import 'package:rickandmorty_app/dao/models/episode_model.dart';
import 'package:http/http.dart' as http;

class ApiEpisodes {
  Future<EpisodeModel?> getEpisodes(int? page) async {
    var URL = Uri.parse('https://rickandmortyapi.com/api/episode?page=$page');
    final response = await http.get(URL);
    if (response.statusCode == 200) {
      var episodesList = jsonDecode(response.body);
      EpisodeModel episodes = EpisodeModel.fromMap(episodesList);
      return episodes;
    } else {
      return null;
    }
  }

  Future<Result?> getEpisode(int id) async {
    var URL = Uri.parse(
      'https://rickandmortyapi.com/api/episode/$id'
    );
    final response = await http.get(URL);
    if (response.statusCode == 200) {
      var episode = jsonDecode(response.body);
      Result episodeModel = Result.fromMap(episode);
      return episodeModel;      
    } else {
      return null;
    }
  }
}