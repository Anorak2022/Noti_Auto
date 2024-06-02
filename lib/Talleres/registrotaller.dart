import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:noti_auto/services/firebase_services.dart';
import 'package:random_string/random_string.dart';
import 'package:provider/provider.dart';

class formregistrotaller extends StatelessWidget {
  formregistrotaller({super.key});

  TextEditingController nombrecontrolador = new TextEditingController();
  TextEditingController direccioncontrolador = new TextEditingController();
  TextEditingController telefonoconotrolador = new TextEditingController();
  TextEditingController nitconotrolador = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 4, 37, 63),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 4, 37, 63),
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Registro de taller",
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ])),
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 10, 12, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nombre',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 245, 243, 243),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: nombrecontrolador,
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Direccion',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 245, 243, 243),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: direccioncontrolador,
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Telefono',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 245, 243, 243),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                    padding: EdgeInsets.only(
                      left: 10.0,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: telefonoconotrolador,
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'NIT',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 245, 243, 243),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: nitconotrolador,
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
                SizedBox(
                  height: 15.0,
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        String id = randomAlphaNumeric(10);
                        Map<String, dynamic> autoinfoMap = {
                          "id": id,
                          "nombre": nombrecontrolador.text,
                          "direccion": direccioncontrolador.text,
                          "telefono": telefonoconotrolador.text,
                          "nit": nitconotrolador.text
                        };
                        await DatabaseMethods()
                            .addtaller(autoinfoMap, id)
                            .then((value) {
                          Fluttertoast.showToast(
                              msg: 'Vehiculo Registrado Correctamente');
                        });

                        nombrecontrolador.clear();
                        direccioncontrolador.clear();
                        telefonoconotrolador.clear();
                        nitconotrolador.clear();
                      },
                      child: Text(
                        'Registrar',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
        ]));
  }
}
