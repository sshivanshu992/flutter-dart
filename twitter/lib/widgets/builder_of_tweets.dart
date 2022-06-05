import 'package:twitter/services/service_of_twitter_db.dart';
import 'package:flutter/material.dart';

class TweetBuilder extends StatelessWidget {
  TweetBuilder({Key? key}) : super(key: key);

  final tweets = TwitterService().getTweet();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tweets.length,
      itemBuilder: (context, index) => Column(
        children: [
          const Divider(
            height: 5.0,
          ),
          ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(tweets[index].profileImageURL)),
            title: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        tweets[index].uname,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '@${tweets[index].userHandler}',
                        style: const TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '${tweets[index].timeSent}h',
                        style: const TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  )
                ],
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 2,
                ),
                Text(
                  tweets[index].message,
                  overflow: TextOverflow.clip,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 10,
                ),
                if (tweets[index].postImageURL != '')
                  Image.network(tweets[index].postImageURL),
                Container(
                  margin: const EdgeInsets.only(top: 6, bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.comment, color: Colors.grey),
                        label: Text(
                          tweets[index].comments,
                          style: const TextStyle(color: Colors.black45),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon:
                            const Icon(Icons.repeat_sharp, color: Colors.grey),
                        label: Text(
                          tweets[index].retweets,
                          style: const TextStyle(color: Colors.black45),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.grey),
                        label: Text(
                          tweets[index].likes,
                          style: const TextStyle(color: Colors.black45),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.share_outlined,
                            color: Colors.grey),
                        label: Text(
                          tweets[index].forwards,
                          style: const TextStyle(color: Colors.black45),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
