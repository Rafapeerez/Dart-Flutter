void main() {
  final Map<String, dynamic> rawJSON = {
    'name': 'Stark',
    'power': 'Money',
    'isAlive': true
  };

  final Hero ironman = Hero.fromJSON(rawJSON);
  print(ironman);
}

class Hero {
  String name;
  String power;
  bool isAlive;

  Hero({required this.name, required this.power, required this.isAlive});

  //Como viene de un JSON y podemos meteer la mata llamando a los nomnresw del JSON(meter un espacio de mas o las mayusculas)
  // es mejor validar de esta forma todo lo que venga del JSON
  Hero.fromJSON(Map<String, dynamic> json)
      : name = json['name'] ?? 'No name found',
        power = json['power'] ?? 'No power found',
        isAlive = json['isAlive'] ?? 'No alive found';

  @override
  String toString() => '$name - $power - ${isAlive ? 'YES!' : 'Nope'}';
}
