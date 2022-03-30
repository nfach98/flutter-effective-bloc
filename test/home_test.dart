import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:majoo_effective_bloc/data/models/joke_model.dart';
import 'package:majoo_effective_bloc/data/repositories/joke_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([http.Client])
void main() {
  test('return joke when call api jokes', () async {
    final client = MockClient((_) async => http.Response(
      '{"setup": "Why does no one like SQLrillex?", "delivery": "He keeps dropping the database."}',
      200,
    ));

    expect(await JokeRepository().getJoke(client), isA<JokeModel>());
  });
}