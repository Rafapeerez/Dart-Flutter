import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  
  static const String name = 'progress_screen';
  
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Text('Circular progress indicator'),
          const SizedBox(height: 20),
          CircularProgressIndicator(strokeWidth: 3, backgroundColor: Colors.black45, color: colors.primary,),
          const SizedBox(height: 20),

          const SizedBox(height: 10),
          const Text('Circular and lineal controlled progress indicator'),
          const SizedBox(height: 20),
          const _ControlledProgressIndicator(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}


class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder( // Data fluid in ejecution period
      stream: Stream.periodic(const Duration( milliseconds: 300), (value) {
        return (value*2) / 100;
      }).takeWhile((value) => value <= 100),

      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progressValue, strokeWidth: 3, backgroundColor: Colors.black38,),
              const SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator(value: progressValue,),
              )
              
            ],
          )
        );
      }
    );
  }
}