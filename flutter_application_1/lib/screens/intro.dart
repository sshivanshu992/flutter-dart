import 'package:flutter/material.dart';
//"https://media-exp1.licdn.com/dms/image/C5603AQGn3oL_oPBbpQ/profile-displayphoto-shrink_800_800/0/1648087454969?e=1656547200&v=beta&t=cLhBoCI-hV1D9cEF81Ph8VQ9TzFlXhKvJYb_ioLu7vg"

class SelfIntro extends StatefulWidget {
  const SelfIntro({Key? key}) : super(key: key);

  @override
  State<SelfIntro> createState() => _SelfIntroState();
}

///
class _SelfIntroState extends State<SelfIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Intro Text'),
      // ),
      body: ListView(children: [
        Stack(
          children: [
            Container(
              color: const Color(0xffe0e0e0),
            ),
            Container(
              height: 150,
              decoration: const BoxDecoration(
                color: Color.fromARGB(141, 9, 17, 92),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(2),
                  bottomRight: Radius.circular(2),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 300.0),
                // Positioned(
                // left:0,
                // right:0,
                // child:
                CircleAvatar(
                  radius: 62,
                  backgroundColor: Colors.redAccent,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://media-exp1.licdn.com/dms/image/C4D03AQHVVrsofj8XwQ/profile-displayphoto-shrink_800_800/0/1517024000300?e=1656547200&v=beta&t=lgmL5XiFXkxuBPzqblE_4Z3D5t03t5_bNYPoVJE9zmo"),
                    // ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 215),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Sekhar Srinivas",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueGrey,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 240),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Microsoft Certified Trainer",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueGrey,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 280),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: const [
                        Text(
                          "Likes",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "9215k",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        Text(
                          "Following",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "235k",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        Text(
                          "Followers",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "897k",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 340, right: 10),
              child: Column(
                children: const [
                  Text(
                    "Sekhar has a rich experience in technology consulting, providing solutions for complex and diverse problems to corporate, he is a person,who always believe in updating himself with the upcoming technologies to deliver the best to the trainees.",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        // letterSpacing: 1.0,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 550),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.email_outlined),
                  Text(
                    " sekharonline4u@gmail.com",
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 580),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.phone_android_outlined),
                  Text(
                    " 9010921619",
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
