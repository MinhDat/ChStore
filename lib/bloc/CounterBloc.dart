import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementEvent extends CounterEvent {
  final int number;

  const IncrementEvent({this.number: 1});

  @override
  List<Object> get props => [number];

  @override
  String toString() => 'IncrementEvent { number: $number }';
}

class DecrementEvent extends CounterEvent {
  final int number;

  const DecrementEvent({this.number: 1});

  @override
  List<Object> get props => [number];

  @override
  String toString() => 'DecrementEvent { number: $number }';
}

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is DecrementEvent) {
      yield state - event.number;
      return;
    }
    if (event is IncrementEvent) {
      yield state + event.number;
      return;
    }
  }
}
