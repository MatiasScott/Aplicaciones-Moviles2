import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_singup/screen/modelo.dart';

class Tomarfoto extends StatefulWidget {
  @override
  _Tomarfoto createState() => _Tomarfoto();
}

class _Tomarfoto extends State<Tomarfoto> {
  final TextEditingController _descripcion = TextEditingController();
  File imagen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tomar Foto'),
          ],
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    //sI LA FOTO ES GRANDE NO SE ROMPE
    return ListView(
      children: [
        Container(
          //dECORACION DE FONDO
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.1), BlendMode.dstATop),
              image: const AssetImage('assets/img/itsqmet.png'),
              fit: BoxFit.contain,
            ),
          ),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  //tITULO
                  Text('Galeria ITSQMET'),
                  Divider(
                    height: 20,
                    thickness: 2,
                    color: Colors.blue,
                  ),
                  //dESCRIPCION
                  TextField(
                      obscureText: false,
                      textCapitalization: TextCapitalization.sentences,
                      controller: _descripcion,
                      decoration: InputDecoration(
                        labelText: 'Descripcion de la foto',
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      )),
                  cams(),
                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onPressed: () {
                        int antes = fotos.length;
                        fotos.add(Galeria(_descripcion.text, imagen));
                        if (fotos.length > antes) {
                          DatosIngresados();
                        } else {
                          DatosnoIngresados();
                        }
                        _descripcion.clear();
                        imagen = null;
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.image), Text('Guardar foto')],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }

  Widget cams() {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //dOS bOTONES UNO PARA TOMAR LA FOTO CON LA CAMARA
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  child: Row(
                    children: [Icon(Icons.camera), Text('Tomar una foto')],
                  ),
                ),
                //dOS bOTONES UNO PARA  sUBUR LA FOTO
                ElevatedButton(
                  //eSTILO PORQUE NO TIENE UN ESTILO PROPIO DEBE HEREDAD DEOTRO BOTON
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  child: Row(
                    children: [Icon(Icons.image), Text('Subir una foto')],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: imagen == null
                  ? Image.asset('assets/img/itsqmet.png')
                  : Image.file(imagen),
            )
          ],
        ),
      ),
    ]);
  }

  final ImagePicker _picker = ImagePicker();
  Future getImage(ImageSource image) async {
    final PickedFile = await _picker.pickImage(source: image);
    setState(() {
      if (PickedFile != null) {
        imagen = File(PickedFile.path);
      }
    });
  }

  void DatosnoIngresados() {
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
                child: Text('No se ha ingresado la foto')),
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

  void DatosIngresados() {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: Text('Correcto'),
          content: Container(
            //   height: 80,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('Foto ingresada Correctamente')),
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
}
