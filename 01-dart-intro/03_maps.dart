void main(){
  final Map<String, dynamic> pokemon = {
    'name': 'Pikachu',
    'hp': 100,
    'isAlive': true,
    'abilities': <String>['impostor'],
    'sprites': /*Map<int, String>*/{
       1: 'pikachu/front.png',
       2: 'pikachu/back.png',
    }
  };
  
  print(pokemon);
  print('Name: ${ pokemon['name'] }');
  print('Sprites: ${ pokemon['sprites'] }');
  
  print('Back: ${ pokemon['sprites'][2] }');
  print('Front: ${ pokemon['sprites'][1] }');
}