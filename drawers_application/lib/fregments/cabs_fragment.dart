import 'package:drawers_application/drawers/create_drawer.dart';
import 'package:drawers_application/widgets/app_bar.dart';
import 'package:drawers_application/widgets/cabs.dart';
import 'package:flutter/material.dart';

class CabsFragment extends StatelessWidget {
  static const String routeName = '/cabs';
  const CabsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidgets('Application App'),
      body: CabsWidgets(),
      drawer: CreateDrawers(),
    );
  }
}
