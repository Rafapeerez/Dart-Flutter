// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration( 
            color: colors.primary, //Color determinate in main.dart(0,1,2,3,4)
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'You are the best!!!',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
