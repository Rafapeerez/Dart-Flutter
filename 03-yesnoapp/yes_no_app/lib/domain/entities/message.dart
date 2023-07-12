//All /domain/entities code is only dart

enum FromWho { messi, me }

class Message {
  final String text;
  final String? meme;
  final FromWho fromWho;

  Message({
    required this.text, 
    this.meme, 
    required this.fromWho
  });
}
