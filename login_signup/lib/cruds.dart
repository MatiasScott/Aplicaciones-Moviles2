import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/provider.dart';

//CREATE: inserción de datos
Future<void> insertUser(String _uname, String _passwd, String _email) async {
  await FirebaseFirestore.instance.collection("usuarios").add({
    'email': _email,
    'password': _passwd,
    'user_name': _uname,
  });
}

//Consulta Usuarios
Future<void> loginUsers(String email, String pass, BuildContext context) async {
  final prov = Provider.of<DatosProvider>(context, listen: false);
  await FirebaseFirestore.instance
      .collection("usuarios")
      .where('email', isEqualTo: email)
      .where('password', isEqualTo: pass)
      .get()
      .then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      prov.isregister = true;
      // print(result.data());
    });
  });
}
