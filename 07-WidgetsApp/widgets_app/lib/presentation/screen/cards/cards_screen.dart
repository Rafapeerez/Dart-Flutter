import 'package:flutter/material.dart';

const cardsData = <Map<String, dynamic>>[
  {'elevation': 0.0, 'Label': 'Elevation 0'},
  {'elevation': 1.0, 'Label': 'Elevation 1'},
  {'elevation': 2.0, 'Label': 'Elevation 2'},
  {'elevation': 3.0, 'Label': 'Elevation 3'},
  {'elevation': 4.0, 'Label': 'Elevation 4'},
  {'elevation': 5.0, 'Label': 'Elevation 5'},
  {'elevation': 6.0, 'Label': 'Elevation 6'},
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  static const String name = 'cards_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //It allows do scroll to not errors by overflow
      child: Column(
        children: [
          ...cardsData.map((card) =>
              _CardType1(elevation: card['elevation'], label: card['Label'])),
          ...cardsData.map((card) =>
              _CardType2(elevation: card['elevation'], label: card['Label'])),
          ...cardsData.map((card) =>
              _CardType3(elevation: card['elevation'], label: card['Label'])),
          ...cardsData.map((card) =>
              _CardType4(elevation: card['elevation'], label: card['Label'])),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_outlined),
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          side: BorderSide(
            color: colors.outline,
          )),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_outlined),
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Text('$label - outlined'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined),
              )
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('$label - filled'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {

    return Card(
      clipBehavior: Clip.hardEdge, //Rounded border
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${ elevation.toInt() }/600/250',
            height: 350,
            fit: BoxFit.cover,
          ),
          
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined),
              ),
            )
          ),
        ],
      ),
    );
  }
}