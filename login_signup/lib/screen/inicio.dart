import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_singup/config/provider.dart';
import 'package:login_singup/screen/modelo.dart';
import 'package:login_singup/screen/tomarfoto.dart';
import 'package:provider/provider.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key key}) : super(key: key);
  @override
  _Inicio createState() => _Inicio();
}

class _Inicio extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    //
    final prov = Provider.of<DatosProvider>(context);
    return Scaffold(
      //App BAr de arriba
      appBar: AppBar(
        //Quita la fleca deregresar
        automaticallyImplyLeading: false,
        title: Row(
          //Ubica los elementos del row
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Inicio'),
            TextButton(
                onPressed: () {
                  //Cambia la Sesion a false y regresa al login
                  prov.isregister = false;
                  Navigator.pop(context);
                },
                child: Text(
                  'Cerrar Sesion',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    //Circulo de carga
    return RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(milliseconds: 500), () {
            // print('Se ha recargado');
            //Actualizar las fotos
            setState(() {});
          });
        },
        child: Container(
            //Container Gramnde con LA foto de decoracion
            decoration: BoxDecoration(
              image: DecorationImage(
                //Opacidad en la foto
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.1), BlendMode.dstATop),
                image: const AssetImage('assets/img/itsqmet.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: ListView(children: [
              //Todo el Contenido
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      //Titulo
                      Text(
                        'Galeria ITSQMET',
                        style: TextStyle(color: Colors.black, fontSize: 26),
                      ),
                      //Linea bonita
                      Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.blue,
                      ),
                      //Boton para cargar la foto
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 5),
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                //Leva a la otrahoja
                                MaterialPageRoute(
                                    builder: (context) => Tomarfoto()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image),
                              Text('Agregar Fotos')
                            ],
                          ),
                        ),
                      ),
                      //generaLos componentes segun el tamaño de la lista y su contenido
                      GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        //# elemntos por fila
                        crossAxisCount: 3,
                        mainAxisSpacing: 1,
                        childAspectRatio: 0.8,
                        padding: EdgeInsets.zero,
                        //Recorre la lista de fotos
                        children: List.generate(fotos.length, (index) {
                          //Retorna el Widget de fotos
                          return _foto(
                              fotos[index].descripcion, fotos[index].foto);
                        }),
                      ),
                    ],
                  ))
            ])));
  }

  //Widget de la foto
  Widget _foto(String descripcion, File foto) {
    return Padding(
      //Separe la una de la otra
      padding: EdgeInsets.all(10),
      child: Container(
        //Borde
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(width: 2, color: Colors.black),
        ),
        child: Column(
          children: [
            //Description arriba
            Text(descripcion),
            Container(
                //Cuando la foto seA NULL
                child: foto == null
                    //pARA pODER pRESIONAR
                    ? InkWell(
                        //cUANDO prESIONA mUESTRA UN sHOWdIALOG CON LA MISA FOTO MAS GRANDE
                        onTap: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(descripcion),
                                actions: [
                                  Image.asset('assets/img/itsqmet.png'),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Aceptar'),
                                  ),
                                ],
                              ),
                            ),
                        child: Image.asset(
                          'assets/img/itsqmet.png',
                        ))
                    //cUANDO prESIONA mUESTRA UN sHOWdIALOG CON LA MISA FOTO MAS GRANDE
                    : InkWell(
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(descripcion),
                            actions: [
                              Image.file(foto),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Aceptar'),
                              ),
                            ],
                          ),
                        ),
                        child: Image.file(
                          foto,
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
