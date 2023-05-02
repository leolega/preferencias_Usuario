import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/share_pref/preferencias_usuario.dart';
import 'package:preferencias_usuario/src/pages/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = true;
  late int _genero;
  String _nombre = 'Pedro';

  late TextEditingController _textController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();

    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = TextEditingController(text: prefs.nombreUsuario);
  }

  _setSelectedRadio(int valor) {
    //prefs.setInt('genero', valor);
    prefs.genero = valor;

    _genero = valor;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(50),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            //

            //
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                });
              },
            ),

            //

            //
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              //antes de modificar el error solo estaba esta linea onChanged: _setSelectedRadio,
              onChanged: (valor) {
                _setSelectedRadio(valor!);
              },
            ),

            //

            //
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              //onChanged: _setSelectedRadio
              onChanged: (valor) {
                _setSelectedRadio(valor!);
              },
            ),

            Divider(),

            //

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el teléfono'),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              ),
            )
          ],
        ));
  }
}
