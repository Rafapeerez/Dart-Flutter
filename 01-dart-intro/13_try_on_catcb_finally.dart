void main() async {
  print('Inicio del programa');
  try {
    final value = await httpGet('http://prueba');
    print('Exito: $value');
  } on Exception catch (error) {
    print('TENEMOS UNA EXCEPCION: $error');
  } catch (error) {
    print('Error: $error');
  } finally {
    print('Fin del try y catch');
  }
  print('Fin del programa');
}

//Los future pueden fallar, manejamos la excepcion
Future<String> httpGet(String urt) async {
  await Future.delayed(const Duration(seconds: 1));
  throw Exception('No hay parametros en la url');
  //throw 'Error en la peticion';
  //return 'Tenemos una respuesta de la peticion';
}
