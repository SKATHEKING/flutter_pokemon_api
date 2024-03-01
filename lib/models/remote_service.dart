
import 'package:http/http.dart' as http;
import 'package:pokemon_api_app/models/pokemon.dart';

class RemoteService
{
  Future<List<Pokemon>> getPokemon() async{
    var client = http.Client();
    var url = Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0");
    var response = await client.get(url);
    if (response.statusCode == 200){
      print(response.statusCode);
      return pokemonFromJson(response.body).results;
    }else{
      print(response.statusCode);
      return [];
    }
  }
}