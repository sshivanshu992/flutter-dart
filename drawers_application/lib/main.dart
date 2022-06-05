// import 'package:drawers_application/screens/drawer_app_main_screen.dart';
// import 'package:drawers_application/screens/list_views_demo.dart';
// import 'package:drawers_application/routes/page_routes.dart';
import 'package:drawers_application/screens/List_grid_views.dart';
// import 'package:drawers_application/screens/list_views_Builder.dart';
// import 'package:drawers_application/widgets/speaker_details.dart';
// import 'package:drawers_application/screens/list_views_separated.dart';
import 'package:flutter/material.dart';

// void main(List<String> args) {
//   runApp(
//     const BookingDrawerApp(),
//   );
// }

// void main(List<String> args) {
//   runApp(
//     const ListViewsDemo(),
//   );
// }

// void main(List<String> args) {
//   runApp(
//     ListViewSeparatedDemo(),
//   );
// }
void main(List<String> args) {
  runApp(
    const MaterialApp(
    home: ListGridViews(),
    )
  );
}


// void main(List<String> args) {
//   runApp(
//     const NavigationRoute(),
//   );
// }

// class NavigationRoute extends StatelessWidget {
//   const NavigationRoute({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/',
//       routes: {
//         '/': (context) => ListViewBuilderdDemo(),
//         SpeakerDetails.routeName: (context) => const SpeakerDetails()
//       },
//     );
//   }
// }
