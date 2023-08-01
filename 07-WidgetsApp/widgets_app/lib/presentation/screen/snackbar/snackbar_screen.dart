import 'package:flutter/material.dart';

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

class _SnackBarView extends StatelessWidget {
  const _SnackBarView();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
