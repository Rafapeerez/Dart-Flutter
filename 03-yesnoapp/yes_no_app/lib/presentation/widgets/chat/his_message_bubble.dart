// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HisMessageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, //Left alignment
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary, //Color determinate in main.dart(0,1,2,3,4)
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'EY PIBE',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),

        const SizedBox(height: 5),

        _ImageBubble(), //Image Widgets

        const SizedBox(height: 5),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; //Info of device, the size is on of the info

    return ClipRRect(
        //Image edit
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          "https://yesno.wtf/assets/yes/3-422e51268d64d78241720a7de52fe121.gif",
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover, //Place the image in the correct space
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child; //Return image

            return Container( //If the image is not loaded, then show a text 
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Wait a second PIBE'),
            );
          },
        ));
  }
}
