import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    SnackBar snackBar = SnackBar(
      content: const Text('Hello World!!!'),
      action: SnackBarAction(
        label: 'EXIT',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar'),
      ),
      body: const _SnackBarView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Show snackBar'),
        icon: const Icon(Icons.perm_device_info),
      ),
    );
  }
}

void customDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, //Obligate to select an option
    builder: (context) =>  AlertDialog(
      title: const Text('Are you sure??'),
      content: const Text(
          'Elit officia laboris ut deserunt aute. Cupidatat eu magna nostrud aute cillum occaecat reprehenderit do ullamco elit excepteur qui velit eu. Deserunt nisi excepteur velit exercitation ex officia irure tempor eiusmod adipisicing sint. Do et irure pariatur ex et ullamco proident nisi laboris. Sint mollit aliquip sit est sit dolore veniam ullamco commodo qui dolore ea nostrud.'),
      actions: [
        TextButton(
          onPressed: () => context.pop(), 
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => context.pop(), 
          child: const Text('Acept'),
        )
      ],
    ),
  );
}

class _SnackBarView extends StatelessWidget {
  const _SnackBarView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(context: context, children: [
                const Text(
                    'Incididunt ad amet amet incididunt elit id amet commodo proident irure est pariatur occaecat. Duis Lorem consequat aute dolore duis velit nisi do. Reprehenderit exercitation dolor sint officia nisi eiusmod ut pariatur occaecat consectetur aliqua incididunt veniam reprehenderit. Laborum consequat fugiat ut quis do reprehenderit dolore sint consequat aute tempor. Tempor ad labore incididunt cillum qui.')
              ]);
            },
            child: const Text('Used licenses'),
          ),
          FilledButton.tonal(
            onPressed: () => customDialog(context),
            child: const Text('Show dialogs'),
          ),
        ],
      ),
    );
  }
}
