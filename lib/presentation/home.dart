import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:majoo_effective_bloc/bloc/joke_bloc.dart';
import 'package:majoo_effective_bloc/data/repositories/joke_repository.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JokeBloc(
        RepositoryProvider.of<JokeRepository>(context)
      )..add(LoadJokeEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Joke App'
          ),
        ),
        body: BlocBuilder<JokeBloc, JokeState> (
          builder: (context, state) {
            if (state is JokeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is JokeLoadedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExpansionTile(
                      key: const Key('expansion_tile'),
                      title: Text(
                        state.joke.setup ?? '',
                        textAlign: TextAlign.center,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.joke.delivery ?? '',
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      key: const Key('button_jokes'),
                      onPressed: () {
                        BlocProvider.of<JokeBloc>(context).add(LoadJokeEvent());
                      },
                      child: const Text('Load Data Joke'),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('Error displaying data'),
              );
            }
          },
        ),
      ),
    );
  }
}
