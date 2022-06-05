import 'package:drawers_application/models/speaker.dart';
import 'package:flutter/material.dart';

class SpeakerDetails extends StatelessWidget {
  static const String routeName = '/speakerDetails';
  const SpeakerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Speaker speaker =
        ModalRoute.of(context)!.settings.arguments as Speaker;
    return Scaffold(
      appBar: AppBar(
        title: Text(speaker.speakerName + 'Details'),
      ),
      body: ListView(
        children: [
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
                children: [
                  const SizedBox(height: 300.0),
                  // Positioned(
                  // left:0,
                  // right:0,
                  // child:
                  CircleAvatar(
                    radius: 62,
                    backgroundColor: Colors.redAccent,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(speaker.imageUrl),
                      // ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 215),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      speaker.speakerName,
                      style: const TextStyle(
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
                  children: [
                    Text(
                      speaker.topic,
                      style: const TextStyle(
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
                        children: [
                          const Text(
                            "Likes",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            '${speaker.likes}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Following",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            '${speaker.following}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Followers",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            '${speaker.followers}',
                            style: const TextStyle(
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
                  children: [
                    Text(
                      speaker.shortDescription,
                      style: const TextStyle(
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
                  children: [
                    const Icon(Icons.email_outlined),
                    Text(
                      speaker.emailId,
                      style: const TextStyle(
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
                  children: [
                    const Icon(Icons.phone_android_outlined),
                    Text(
                      speaker.mobileNo,
                      style: const TextStyle(
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
        ],
      ),
    );
  }
}
