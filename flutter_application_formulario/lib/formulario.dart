import 'package:flutter/material.dart';

class formulario extends StatefulWidget {
  @override
  _formulario createState() => _formulario();
}

class _formulario extends State<formulario> {
  final txtNombre = TextEditingController();
  final txtApellido = TextEditingController();
  final txtDireccion = TextEditingController();
  final txtTelefono = TextEditingController();
  final txtEmail = TextEditingController();

  bool value = false;
  bool value1 = false;
  bool value2 = false;

  String nombre = "";
  String apellido = "";
  String direccion = "";
  String telefono = "";
  String correo = "";

  void limpiarText() {
    txtNombre.clear();
    txtApellido.clear();
    txtDireccion.clear();
    txtTelefono.clear();
    txtEmail.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
            alignment: Alignment.center,
            child: Text(
              "Formulario",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(5.0)),
                    margin: EdgeInsets.only(top: 3.0),
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        new Expanded(
                          child: TextField(
                            controller: txtNombre,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Ejemplo: Matias",
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(5.0)),
                    margin: EdgeInsets.only(top: 3.0),
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        new Expanded(
                          child: TextField(
                            controller: txtApellido,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Ejemplo: Valdivieso",
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(5.0)),
                    margin: EdgeInsets.only(top: 3.0),
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.directions,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        new Expanded(
                          child: TextField(
                            controller: txtDireccion,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  "Ejemplo: Juan León Mera y AV. 10 de Agosto",
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(5.0)),
                    margin: EdgeInsets.only(top: 3.0),
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.call,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        new Expanded(
                          child: TextField(
                            controller: txtTelefono,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Ejemplo: 0987654321",
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(5.0)),
                    margin: EdgeInsets.only(top: 3.0),
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.mail_outline_sharp,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        new Expanded(
                          child: TextField(
                            controller: txtEmail,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Ejemplo: alguien@gmail.com",
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text(
                            "Seleccione su genero",
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(unselectedWidgetColor: Colors.grey),
                          child: CheckboxListTile(
                            title: const Text(
                              'Hombre',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            value: value,
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;
                              });
                            },
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(unselectedWidgetColor: Colors.grey),
                          child: CheckboxListTile(
                            title: const Text(
                              'Mujer',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            value: value1,
                            onChanged: (value1) {
                              setState(() {
                                this.value1 = value1!;
                              });
                            },
                          ),
                        ),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(unselectedWidgetColor: Colors.grey),
                          child: CheckboxListTile(
                            title: const Text(
                              'Otros',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            value: value2,
                            onChanged: (value2) {
                              setState(() {
                                this.value2 = value2!;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 15.0,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(5.0)),
            margin: EdgeInsets.only(right: 15.0, left: 15.0),
            child: MaterialButton(
              child: Text(
                "Enviar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onPressed: () {
                nombre = txtNombre.text;
                apellido = txtApellido.text;
                direccion = txtDireccion.text;
                telefono = txtTelefono.text;
                correo = txtEmail.text;
                if (nombre.isEmpty &&
                    apellido.isEmpty &&
                    direccion.isEmpty &&
                    telefono.isEmpty &&
                    correo.isEmpty) {
                  AlertDialog alert = AlertDialog(
                    title: Text('Campos vacios'),
                    content: Text("Por favor llenar los campos vacios"),
                    actions: [
                      MaterialButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
