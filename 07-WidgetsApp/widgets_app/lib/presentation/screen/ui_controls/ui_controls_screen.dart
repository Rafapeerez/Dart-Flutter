import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI-Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, subhmarine, helicopter }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDevelopper = false;
  Transportation trans = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(physics: const ClampingScrollPhysics(), children: [
      SwitchListTile(
          title: const Text('Developper mode'),
          subtitle: const Text(
              'Cupidatat incididunt pariatur pariatur veniam incididunt duis adipisicing veniam dolor proident.'),
          value: isDevelopper,
          onChanged: (value) => setState(() {
                isDevelopper = !isDevelopper;
              })),
      ExpansionTile(
        title: const Text('Transportation vehicle'),
        subtitle: Text('$trans'),
        children: [
          RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Default'),
              value: Transportation.car,
              groupValue: trans,
              onChanged: (value) => setState(() {
                    trans = Transportation.car;
                  })),
          RadioListTile(
              title: const Text('Plane'),
              value: Transportation.plane,
              groupValue: trans,
              onChanged: (value) => setState(() {
                    trans = Transportation.plane;
                  })),
          RadioListTile(
              title: const Text('Boat'),
              value: Transportation.boat,
              groupValue: trans,
              onChanged: (value) => setState(() {
                    trans = Transportation.boat;
                  })),
          RadioListTile(
              title: const Text('Helicopter'),
              value: Transportation.helicopter,
              groupValue: trans,
              onChanged: (value) => setState(() {
                    trans = Transportation.helicopter;
                  })),
          RadioListTile(
              title: const Text('Submarine'),
              value: Transportation.subhmarine,
              groupValue: trans,
              onChanged: (value) => setState(() {
                    trans = Transportation.subhmarine;
                  })),
        ],
      ),
      CheckboxListTile(
        title: const Text('Breakfast???'),
        value: wantsBreakfast,
        onChanged: (value) => setState(() {
          wantsBreakfast = !wantsBreakfast;
        })
      ), 
      CheckboxListTile(
        title: const Text('Lunch???'),
        value: wantsLunch,
        onChanged: (value) => setState(() {
          wantsLunch= !wantsLunch;
        })
      ),
      CheckboxListTile(
        title: const Text('Dinner???'),
        value: wantsDinner,
        onChanged: (value) => setState(() {
          wantsDinner = !wantsDinner;
        })
      )
    ]);
  }
}
