import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String name = 'buttons_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: [
              /* ELEVATED BUTTON */
              ElevatedButton(
                  onPressed: () {}, child: const Text('Elevated button')),
              const ElevatedButton(onPressed: null, child: Text('Disable')),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm_rounded),
                label: const Text('Elevated Icon'),
              ),
              /* FILLED BUTTON */
              FilledButton(
                  onPressed: () {}, child: const Text('Filled button')),
              FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.account_tree),
                  label: const Text('Icon filled')),
              /* OUTLINED BUTTON */
              OutlinedButton(onPressed: () {}, child: const Text('outlined')),
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add_reaction_outlined),
                  label: const Text('Outlined icon')),

              /* TEXT BUTTON */
              TextButton(onPressed: () {}, child: const Text('Text button')),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.zoom_out_outlined),
                label: const Text('Text button'),
              ),
              /* ICON BUTTON */
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.zoom_out_outlined)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.zoom_out_outlined),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                ),
              ),

              /* CUSTOM BUTTOM */
              const CustomButton(),
            ],
          )),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Custom Button', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
