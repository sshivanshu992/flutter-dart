import 'package:flutter/material.dart';
import 'package:know_your_state/screens/all_states.dart';
import 'package:know_your_state/screens/state_details.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      ///initialRoute: AllStates.routeName,
      initialRoute: '/',

      routes: {
        /// AllStates.routeName: (context) => AllStates(),
        '/': (context) => AllStates(),

        StateDetails.routeName: (context) => const StateDetails()
      },
    ),
  );
}
