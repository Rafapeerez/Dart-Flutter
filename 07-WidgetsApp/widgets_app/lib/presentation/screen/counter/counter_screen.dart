import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/Providers/counter_priovider.dart';
import 'package:widgets_app/presentation/Providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //It works the same like stless

    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
            },
            icon: isDarkMode ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode)
          )
        ],
      ),
      body: Center(
          child: Text(
        'Valor: $clickCounter',
        style: Theme.of(context).textTheme.titleLarge,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          /* ref.read(counterProvider.notifier).update((state) => state + 1);` */
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
