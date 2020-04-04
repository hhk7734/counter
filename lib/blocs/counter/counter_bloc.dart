import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _count;

  @override
  CounterState get initialState {
    _count = 0;
    return CounterInitial();
  }

  @override
  Stream<CounterState> mapEventToState(
    // Receive event from publisher and transmit state to subscriber.
    CounterEvent event,
  ) async* {
    if (event is CounterIncremented) {
      _count++;
    } else if (event is CounterDecremented) {
      _count--;
    }

    // Must yield a new instance of the state.
    // If yielding same state twice, it will not respond.
    yield CounterUpdate(_count);
  }
}
