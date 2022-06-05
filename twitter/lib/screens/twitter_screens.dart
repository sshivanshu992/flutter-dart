import 'package:flutter/material.dart';
import 'package:twitter/widgets/builder_of_tweets.dart';

class Twitter extends StatelessWidget {
  Twitter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'Twitter',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
          leading: Container(
            margin: const EdgeInsets.all(7.0),
            child: const CircleAvatar(
              backgroundColor: Colors.amberAccent,
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1507536239737540608/k5BpcYQS.jpg'),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.timeline_sharp,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: TweetBuilder(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          onTap: (int i) {},
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.keyboard_voice_sharp),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
