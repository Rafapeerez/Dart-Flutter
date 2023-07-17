import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/fullscren_player.dart';
import 'package:toktik/presentation/widgets/shared/video_button.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical, // Scroll direction
      physics: const BouncingScrollPhysics(), //When it finishes to have a rebound effect
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            //Video Player
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoURL,
              ),
            ),

            //Buttons part
            Positioned(
              bottom: 40,
              right: 10,
              child: VideoButtons(video: videoPost)
            ),
          ],
        );
      },
    );
  }
}
