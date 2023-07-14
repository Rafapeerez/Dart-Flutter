import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'You are the best', fromWho: FromWho.me),
    Message(text: 'The best footballer in the world', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);

    if (text.endsWith('??')) {
      leoReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> leoReply() async {
    final lioMessage = await getYesNoAnswer.getAnswer();

    messages.add(lioMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent, //Goes to the final
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
