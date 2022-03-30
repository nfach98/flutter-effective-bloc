import 'package:majoo_effective_bloc/data/models/joke_model.dart';
import 'package:http/http.dart' as http;

class JokeRepository {
  final String _baseUrl = 'https://v2.jokeapi.dev/joke/Any'
      '?blacklistFlags=nsfw,religious,political,racist,sexist,explicit'
      '&type=twopart';

  Future<JokeModel> getJoke(http.Client client) async {
    final response = await client.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return jokeModelFromJson(response.body);
    } else {
      throw Exception('Failed to load joke');
    }
  }
}