import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(const MyFirebaseApp());
  });
}

class MyFirebaseApp extends StatelessWidget {
  const MyFirebaseApp({Key? key}) : super(key: key);

  //set isChecked(bool isChecked) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      theme: ThemeData(scaffoldBackgroundColor: Colors.green[300]),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Tareas Firebase'),
            backgroundColor: Colors.grey,
          ),
          body: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('prueba_firebse')
                  .snapshots(), //conexion a la bdd
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<DocumentSnapshot?> documents = snapshot.data!.docs;
                return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic>? datos =
                          documents[index]?.data() as Map<String, dynamic>?;
                      return ListTile(
                        leading: Text('Nombre y Apellido', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.brown)),
                        title: Text(datos?['nombre'], style: TextStyle(fontWeight: FontWeight.w900, color: Colors.blueAccent)),
                        subtitle: Text(datos?['apellido'], style: TextStyle(fontWeight: FontWeight.w900, color: Colors.deepOrange)),                                                     
                      );
                    });
              })),
    );
  }

}
