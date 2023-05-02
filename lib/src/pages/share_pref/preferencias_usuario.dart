import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences? _prefs;

  Future<void> initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del género
  int get genero {
    if (_prefs == null) return 1; // Asegurarse de que _prefs esté inicializado
    return _prefs!.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs?.setInt('genero', value);
  }

  //GET y SET del _colorSecundario
  bool get colorSecundario {
    if (_prefs == null)
      return false; // Asegurarse de que _prefs esté inicializado
    return _prefs!.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    if (_prefs == null) return; // Asegurarse de que _prefs esté inicializado
    _prefs!.setBool('colorSecundario', value);
  }

//GET y SET de _nombreUsuario
  String get nombreUsuario {
    if (_prefs == null) return ''; // Asegurarse de que _prefs esté inicializado
    return _prefs!.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value) {
    _prefs?.setString('nombreUsuario', value);
  }

//GET y SET de la última página

  String get ultimaPagina {
    if (_prefs == null)
      return 'home'; // Asegurarse de que _prefs esté inicializado
    return _prefs!.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value) {
    if (_prefs == null) return; // Asegurarse de que _prefs esté inicializado
    _prefs!.setString('ultimaPagina', value);
  }
}

//Codigo de vídeo antes de mis cambios y correcciones
// import 'package:shared_preferences/shared_preferences.dart';

// class PreferenciasUsuario {
//   static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

//   factory PreferenciasUsuario() {
//     return _instancia;
//   }
//   PreferenciasUsuario._internal();

//   SharedPreferences _prefs;

//   initPrefs() async {
//     this._prefs = await SharedPreferences.getInstance();
//   }

// //ninguna de esas propiedades se usa
//   // bool _colorSecundario;
//   // int _genero;
//   // String _nombre;

// //GET Y SET del género
//   get genero {
//     return _prefs.getInt('genero') ?? 1;
//   }

//   set genero(int value) {
//     _prefs.setInt('genero', value);
//   }
// }