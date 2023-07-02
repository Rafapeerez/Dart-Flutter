void main() {
  final Hero wolverine = Hero(name: 'Logan', power: 'Regeneracion');

  print(wolverine);

  print(wolverine.name);
  print(wolverine.power);

  print(wolverine.toString());
}

class Hero {
  String name;
  String power;

  //Constructor
  Hero({required this.name, this.power = 'No power'});
  //Hero( String pName, String pPower) : name = pName, power = pPower;

  @override
  String toString() {
    return '$name - $power';
  }
}
