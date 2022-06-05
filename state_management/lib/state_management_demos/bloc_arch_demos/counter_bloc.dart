import 'dart:async';

import 'package:state_management/state_management_demos/bloc_arch_demos/counter_events.dart';

class CounterBLoc {
  int _counter = 0;

  ///Controllers to maintain the state

  final _counterStateController = StreamController<int>();

  //for input
  StreamSink<int> get _intCounter => _counterStateController.sink;
  //for output
  Stream<int> get counter => _counterStateController.stream;

  ///Controllers to Handle the events
  final _counterEventController = StreamController<CounterEvents>();
  Sink<CounterEvents> get counterEventSink => _counterEventController.sink;

  CounterBLoc() {
    _counterEventController.stream.listen((event) {
      if (event is IncrementEvent) _counter++;
      if (event is DecrementEvent) _counter--;
      _intCounter.add(_counter);
    });
  }

  ///Dispose all the Controllers created
  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
