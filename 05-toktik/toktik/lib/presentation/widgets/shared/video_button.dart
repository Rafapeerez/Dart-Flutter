import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/views_format.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(value: video.likes, iconData: Icons.favorite, iconColor: Colors.red),
        _CustomIconButton(value: video.views, iconData: Icons.remove_red_eye_outlined),
        const SizedBox(height: 20,),
        SpinPerfect( //Using animate_do
          infinite: true,
          duration: const Duration(seconds: 3),
          child: const _CustomIconButton(value: 0, iconData: Icons.play_circle_outline)
        ),
      ]    
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({ 
    required this.value, 
    required this.iconData, 
    iconColor
  }):color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon( iconData, color: color, size: 30,),
        ),
        if( value > 0 ) Text( ViewsFormat.viewsNumber(value.toDouble()) ),
      ]
    );
  }
}
