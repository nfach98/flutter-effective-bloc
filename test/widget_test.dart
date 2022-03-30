import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:majoo_effective_bloc/data/repositories/joke_repository.dart';
import 'package:majoo_effective_bloc/main.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('Home screen test', (tester) async {
    final client = MockClient((_) async => http.Response(
      '{"setup": "Why does no one like SQLrillex?", "delivery": "He keeps dropping the database."}',
      200,
    ));

    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byKey(const Key('button_jokes')));
    await JokeRepository().getJoke(client);

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('expansion_tile')));

    expect(find.text('He keeps dropping the database.'), findsOneWidget);
  });
}
