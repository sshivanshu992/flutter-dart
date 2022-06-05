class TwitterDB {
  final String profileImageURL;
  final String uname;
  final String userHandler;
  final String timeSent;
  final String message;
  final String postImageURL;
  final String comments;
  final String retweets;
  final String likes;
  final String forwards;
  TwitterDB(
      this.profileImageURL,
      this.uname,
      this.userHandler,
      this.timeSent,
      this.message,
      this.comments,
      this.retweets,
      this.likes,
      this.forwards,
      {this.postImageURL=''});
}
