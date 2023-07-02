void main() async {
  print('Inicio del programa');
  try {
    final value = await httpGet('http://prueba');
    print(value);
  } catch (error) {
    print('Error: $error');
  }
  print('Fin del programa');
}

//Los future pueden fallar, manejamos la excepcion
Future<String> httpGet(String urt) async {
  await Future.delayed(const Duration(seconds: 1));
  throw 'Error en la peticion';
  //return 'Tenemos una respuesta de la peticion';
}
