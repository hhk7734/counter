import 'package:counter/blocs/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Bloc'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterUpdate) {
            return Center(
              child: Text(
                '${state.count}',
                style: TextStyle(fontSize: 30),
              ),
            );
          }

          return Center(
            child: Text('Click the arrow button at the bottom right'),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(CounterIncremented());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: FloatingActionButton(
              child: Icon(Icons.arrow_downward),
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(CounterDecremented());
              },
            ),
          )
        ],
      ),
    );
  }
}
