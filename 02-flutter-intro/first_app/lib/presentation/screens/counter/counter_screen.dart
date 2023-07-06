//Using Flutter Snippets
import 'package:flutter/material.dart'; //impm

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;
  //String textClick = 'Clicks';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 150, fontWeight: FontWeight.w200)),
            //Text(textClick, style: const TextStyle(fontSize: 50))
            Text('Click${ clickCounter == 1 ? '':'s'}', style: const TextStyle(fontSize: 50))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clickCounter++;
          /* if (clickCounter == 1) {
            textClick = 'Click';
          } else {
            textClick = 'Clicks';
          } */
          setState(() {});
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
