import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:login_singup/config/palette.dart';
import 'package:login_singup/config/provider.dart';
import 'package:login_singup/cruds.dart';
import 'package:login_singup/screen/inicio.dart';
import 'package:provider/provider.dart';
import 'package:login_singup/auth_with_google.dart';
import 'package:login_singup/models/firebase_user.dart';
import '../auth_with_google.dart';
import '../models/firebase_user.dart';

//Declaras la clase
class LoginSignupScreen2 extends StatefulWidget {
  const LoginSignupScreen2({Key key}) : super(key: key);
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen2> {
  //Declaras controladores de TExto
  final TextEditingController _email = TextEditingController();
  final TextEditingController _usuario = TextEditingController();
  final TextEditingController _pasword = TextEditingController();
  final AuthServiceGoogle _auth = AuthServiceGoogle();
  final FirebaseUser _user = FirebaseUser();
  bool register = false;

  @override
  void initState() {
    super.initState();
    _user.user(_auth.user);
  }

  //Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesion'),
      ),
      body: body(),
    );
  }

  Widget body() {
    //Esta Centrado
    return Center(
        child: Container(
      ///Detectar el Tamaño de la pantalla y a partir de eso le asigna
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,
      //Borde redondeado y negro
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        border: Border.all(width: 2, color: Colors.black),
      ),

      //PAding De todo
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: register
              ? Column(
                  children: [
                    _textField('Email', TextInputType.text, _email,
                        TextCapitalization.sentences, false),
                    _textField('Usuario', TextInputType.text, _usuario,
                        TextCapitalization.sentences, false),
                    _textField('Contraseña', TextInputType.text, _pasword,
                        TextCapitalization.sentences, true),
                    TextButton(
                        onPressed: () {
                          cleaner();
                          register = false;
                          setState(() {});
                        },
                        child: const Text('o--Iniciar Sesion')),
                    buttonLogin(2, 'Registrar'),
                    Divider(
                      height: 20,
                      thickness: 2,
                      color: Colors.black,
                    ),
                    Text('Iniciar sesion con google'),
                  ],
                )
              : Column(
                  children: [
                    _textField('Email', TextInputType.text, _email,
                        TextCapitalization.sentences, false),
                    _textField('Contraseña', TextInputType.text, _pasword,
                        TextCapitalization.sentences, true),
                    TextButton(
                        onPressed: () {
                          cleaner();
                          register = true;
                          setState(() {});
                        },
                        child: const Text('O --Registrar')),
                    buttonLogin(1, 'Iniciar Sesion'),
                    Divider(
                      height: 20,
                      thickness: 2,
                      color: Colors.black,
                    ),
                    Text('Iniciar sesion con google'),
                    buildTextButtonG(MaterialCommunityIcons.google_plus,
                        "Google", Palette.googleColor),
                    Divider(
                      height: 20,
                      thickness: 2,
                      color: Colors.black,
                    ),
                    Center(
                      child: _user.uid != null ? _logged() : _login(),
                    )
                  ],
                )),
    ));
  }

  ElevatedButton _login() {
    return ElevatedButton.icon(
      icon: const Icon(Icons.login),
      label: const Text('Log in'),
      onPressed: () async {
        await _auth.signInGoogle();
        setState(() {
          _user.user(_auth.user);
        });
      },
    );
  }

  Column _logged() {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(_user.imageUrl),
        ),
        Text(_user.name),
        Text(_user.email),
        ElevatedButton.icon(
          icon: const Icon(Icons.logout),
          label: const Text('Log out'),
          onPressed: () async {
            await _auth.signOutGoogle();
            setState(() {
              _user.user(_auth.user);
            });
          },
        ),
      ],
    );
  }

  TextButton buildTextButtonG(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      //onHover: Navigator.pop(context, true),
      onPressed: () async {
        await _auth
            .signInGoogle(); //llamada a la funcion implementada para conectar con google
        setState(() {
          _user.user(_auth.user);
        });
      },
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(115, 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget buttonLogin(int tipo, String title) {
    final prov = Provider.of<DatosProvider>(context);
    return Container(
      child: Column(children: <Widget>[
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              shadowColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            onPressed: () async {
              if (tipo == 1) {
                await loginUsers(_email.text, _pasword.text, context);
                if (prov.isregister) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Inicio()));
                  cleaner();
                } else {
                  noiniciada();
                }
                setState(() {});
              }
              if (tipo == 2) {
                await insertUser(
                  _usuario.text,
                  _pasword.text,
                  _email.text,
                );
                registrados();
                cleaner();
              }
              setState(() {});
            },
            child: Text(title))
      ]),
    );
  }

  Widget _textField(
      String placeholder,
      TextInputType tipoTexto,
      TextEditingController controlador,
      TextCapitalization textCapitalization,
      bool bool) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      ),
      child: TextField(
          obscureText: bool,
          keyboardType: tipoTexto,
          textCapitalization: textCapitalization,
          controller: controlador,
          decoration: InputDecoration(
            labelText: placeholder,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          )),
    );
  }

  void registrados() {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: Text('Exito'),
          content: Container(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('Datos Ingresados Correctamente')),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void noiniciada() {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: Text('Error'),
          content: Container(
            //   height: 80,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('Credenciles Incorrectas')),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void cleaner() {
    _usuario.clear();
    _pasword.clear();
    _email.clear();
  }
}
