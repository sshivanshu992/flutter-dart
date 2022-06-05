import 'package:flutter/material.dart';
anydesk, 
class RowFlexBox extends StatelessWidget {
  const RowFlexBox({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.book),
        title: const Text('Row Flex Box'),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        // height: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.white,
              child: const Center(
                child: Text(
                  'White',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
              child: const Center(
                child: Text(
                  'White',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'White',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}