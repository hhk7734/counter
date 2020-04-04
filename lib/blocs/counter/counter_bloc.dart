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
    CounterEvent event,
  ) async* {
    if (event is CounterIncremented) {
      _count++;
    } else if (event is CounterDecremented) {
      _count--;
    }

    yield CounterUpdate(_count);
  }
}
