void main() {
  print('Inicio del programa');
  httpGet('https://prueba').then((value) {
    print(value);
  }).catchError((error) {
    print('ERROR: ');
  });
  print('Fin del programa');
}

//Los future pueden fallar, manejamos la excepcion
Future<String> httpGet(String urt) {
  return Future.delayed(const Duration(seconds: 1), () {
    throw 'Error en la peticion http';
    //return 'Respuesta de la peticion http';
  });
}
