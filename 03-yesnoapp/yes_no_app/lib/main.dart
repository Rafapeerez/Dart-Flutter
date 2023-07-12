//mateapp
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/providers-chat/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider(),)
      ],
      child: MaterialApp(
        title: 'Yes/No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme( selectedColor: 3).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}