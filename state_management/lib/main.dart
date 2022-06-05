import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:state_management/flutter_redux.dart';
// import 'package:redux/redux.dart';
// import 'package:state_management/state_management_demos/bloc_arch_demos/counter_bloc_app.dart';
import 'package:state_management/state_management_demos/provider_demos/counter_provider_mixin.dart';
import 'package:state_management/state_management_demos/provider_demos/counter_provider_screen.dart';

// flutter_redux
// Future main(List<String> args) async {
//   final store = Store<int>(counterReduce, initialState: 0);
//   runApp(FlutterReduxApp(store: store));
// }

///bloc_arch_demos
// Future main(List<String> args) async {
//   runApp(
//     const MaterialApp(
//       home: CounterApp(),
//     ),
//   );
// }

///provider_demos

class StatemanagementDemo extends StatelessWidget {
  const StatemanagementDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProviderCounter(),
    );
  }
}

Future main(List<String> args) async {
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider.value(
          value: Counter(),
        ),
      ],
      child: const StatemanagementDemo(),
    ),
  );
}
