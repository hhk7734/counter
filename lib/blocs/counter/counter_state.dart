part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {}

class CounterUpdate extends CounterState {
  final int count;

  const CounterUpdate(this.count);

  // Pass all properties to props.
  @override
  List<Object> get props => [count];

  @override
  String toString() => 'Update count to $count';
}
