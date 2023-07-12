import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    Message(text: 'You are the best', fromWho: FromWho.me),
    Message(text: 'The best footballer in the world', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    //TODO: Implementar metodo
  }
}
