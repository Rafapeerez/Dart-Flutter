class VideoPost {
  final String caption;
  final String videoURL;
  final int likes;
  final int views;


  VideoPost({
    required this.caption, 
    required this.videoURL, 
    this.likes = 0, 
    this.views = 0, 
  });
}
