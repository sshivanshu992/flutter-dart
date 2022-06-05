import 'package:flutter/material.dart';
import 'package:state_management/state_management_demos/inherited_widgets_demos/my_counter.dart';

//? Code for creating an Inherited Widget

class CounterInheritedWidget extends InheritedWidget {
  final MyInheritCounter myInheritCounter;
  final Widget childWidget;

  const CounterInheritedWidget(
      {Key? key, required this.myInheritCounter, required this.childWidget})
      : super(key: key, child: childWidget);

  @override
  bool updateShouldNotify(covariant CounterInheritedWidget oldWidget) {
    return myInheritCounter != oldWidget.myInheritCounter;
  }

  static CounterInheritedWidget? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType(aspect: CounterInheritedWidget);
}
