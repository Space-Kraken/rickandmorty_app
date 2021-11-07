import 'dart:convert';

import 'package:rickandmorty_app/dao/models/character_model.dart';
import 'package:http/http.dart' as http;

class ApiCharacters {
  Future<CharacterModel?> getCharacters(int? page) async{
    var URL = Uri.parse('https://rickandmortyapi.com/api/character?page=$page');
    final response = await http.get(URL);
    if(response.statusCode == 200){
      var charactersList = jsonDecode(response.body);
      CharacterModel characters = CharacterModel.fromMap(charactersList);
      return characters;
    }else{
      return null;
    }
  }

  Future<Result?> getCharacter(int id) async{
    var URL = Uri.parse(
      'https://rickandmortyapi.com/api/character/$id'
    );
    final response = await http.get(URL);
    if (response.statusCode == 200) {
      var character = jsonDecode(response.body);
      Result characterModel = Result.fromMap(character);
      return characterModel;
    } else {
      return null;
    }
  }
}