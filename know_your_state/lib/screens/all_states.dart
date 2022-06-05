import 'package:flutter/material.dart';
import 'package:know_your_state/screens/state_details.dart';
import 'package:know_your_state/services/state_db.dart';
import 'package:know_your_state/utils/app_colors.dart';

class AllStates extends StatefulWidget {
  const AllStates({Key? key}) : super(key: key);

  @override
  State<AllStates> createState() => _AllStatesState();
}

class _AllStatesState extends State<AllStates> {
  final _states = StateDB().getState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isTap ? blackColor : whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 3,
        centerTitle: true,
        backgroundColor: isTap ? cardColor : whiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: RichText(
          text: TextSpan(
            style:
                TextStyle(color: isTap ? whiteColor : blackColor, fontSize: 22),
            children: [
              TextSpan(
                text: 'KNOW YOU ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isTap ? whiteColor54 : blackColor54,
                  letterSpacing: 1.5,
                ),
              ),
              const TextSpan(
                text: 'STATE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                isTap = isTap ? false : true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                isTap ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                color: isTap ? whiteColor : blackColor,
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(left: 6, right: 6, top: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // crossAxisSpacing: 1.0,
          // mainAxisSpacing: 1.0,
        ),
        itemCount: _states.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, StateDetails.routeName,
                  arguments: _states[index]);
            },
            child: Card(
              color: isTap ? cardColor : whiteColor,
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    _states[index].stateName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: isTap ? whiteColor54 : blackColor54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
