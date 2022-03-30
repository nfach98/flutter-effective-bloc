import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:majoo_effective_bloc/data/models/joke_model.dart';
import 'package:majoo_effective_bloc/data/repositories/joke_repository.dart';

part 'joke_state.dart';
part 'joke_event.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeRepository _jokeRepository;

  JokeBloc(this._jokeRepository) : super(JokeLoadingState()) {
    on<LoadJokeEvent>((event, emit) async {
      emit(JokeLoadingState());

      try {
        final joke = await _jokeRepository.getJoke(Client());
        emit(JokeLoadedState(joke));
      } catch (exception) {
        emit(JokeErrorState(exception.toString()));
      }
    });
  }
}