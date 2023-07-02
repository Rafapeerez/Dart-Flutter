void main() {
  final Square square = Square(side: -10);

  square.side = 5;
  print('Area: ${square.calculateArea()}');
}

class Square {
  double _side; // side*side

  //Constructor
  //Primero las aserciones ya que si la asercion se da se para
  Square({required double side})
      : assert(side >= 0, 'Side must be >= 0'),
        _side = side;

  double get area => _side * _side;
  set side(double value) {
    print('Setting side value $value');

    //Lanzo un error
    if (value < 0) throw 'Value must be >= 0';

    _side = value;
  }

  double calculateArea() => _side * _side;
}
