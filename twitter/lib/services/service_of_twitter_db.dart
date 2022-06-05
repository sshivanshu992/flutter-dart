import 'package:twitter/models/twitter_db.dart';

class TwitterService {
  List<TwitterDB> getTweet() {
    List<TwitterDB> tweets = [
      TwitterDB(
        'https://pbs.twimg.com/profile_images/713370773134532608/IrJ2F6o-_400x400.jpg',
        'sshivanshu992',
        'elonmush',
        '13',
        'this is a twitter message',
        '2',
        '2 ',
        '5',
        '1',
        postImageURL:
            'https://pbs.twimg.com/profile_images/713370773134532608/IrJ2F6o-_400x400.jpg',
      ),
      TwitterDB(
        'https://www.bing.com/th?id=AMMS_be3bffab0b0d37217f6eb1d025f8f64e&w=76&h=100&c=8&o=6&pid=SANGAM',
        'elonmush',
        'twitter',
        '1',
        "Since I've been asked a lot: Buy stock in several companies that make products & services that *you* believe in. Only sell if you think their products & services are trending worse. Don't panic when the market does. you well in the long-term.",
        '200',
        '12 ',
        '500',
        '1000',
        postImageURL:
            'https://pbs.twimg.com/media/FRY2bgKVkAArI9L?format=jpg&name=small',
      ),
      TwitterDB(
        'https://www.bing.com/th?id=OIP.8teeOGKZGx0bfM_fLuqU8AHaGL&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
        'ratantata',
        'indain',
        '10',
        'Rajesh "Raju" Ratan Tata (born 17 July 1948) is an Indian industrialist and the chairman of Tata Sons, the holding company of the Tata Group.',
        '2',
        '2 ',
        '5',
        '1',
        // postImageURL: 'https://www.bing.com/th?id=A6a3c42d8e0646df9ffaacf8f90a8fef8&w=115&h=87&o=6&oif=webp&pid=SANGAM',
      ),
      TwitterDB(
        'https://www.bing.com/th?id=AMMS_be3bffab0b0d37217f6eb1d025f8f64e&w=76&h=100&c=8&o=6&pid=SANGAM',
        'elonmush',
        'twitter',
        '1',
        "Since I've been asked a lot: Buy stock in several companies that make products & services that *you* believe in. Only sell if you think their products & services are trending worse. Don't panic when the market does. you well in the long-term.",
        '200',
        '12 ',
        '500',
        '1000',
        postImageURL:
            'https://pbs.twimg.com/media/FRY2bgKVkAArI9L?format=jpg&name=small',
      ),
    ];
    return tweets;
  }
}
