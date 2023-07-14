// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/providers-chat/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Top where is the image and Text
        leading: Padding(
          padding: const EdgeInsets.all(3.5), //Circle side
          child: const CircleAvatar(
            //Image
            backgroundImage: NetworkImage(
                'https://as01.epimg.net/img/comunes/fotos/fichas/deportistas/m/mes/large/15167.png'),
          ),
        ),
        title: const Text('Don Lionel'), //Text
        centerTitle: false, //No center text
      ),
      body: _ChatView(), //Reference to widget
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    //keep an eye on class changes, search a chatProvider instance
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      //Respect the mobile areas
      child: Padding(
        //To separate
        padding: const EdgeInsets.symmetric(horizontal: 10), //Equal padding horizontal and vertical
        child: Column(
          children: [
            Expanded( //Expand children widget in all available space
              child: ListView.builder( //Constructor, function launched in execution time
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];

                  return (message.fromWho == FromWho.messi)
                      ? HisMessageBubble(message: message)
                      : MyMessageBubble( message: message );
                },
              ),
            ),
            MessageFieldBox(
              //onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
