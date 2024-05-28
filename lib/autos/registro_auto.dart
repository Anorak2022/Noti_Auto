//import 'dart:html';
//import 'dart:js_interop';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:noti_auto/services/firebase_services.dart';
import 'package:random_string/random_string.dart';
import 'package:provider/provider.dart';

class formregistroauto extends StatelessWidget {
  formregistroauto({super.key});

TextEditingController placacontrolador = new TextEditingController();
  TextEditingController usuariocontrolador = new TextEditingController();
  TextEditingController marcacontrolador = new TextEditingController();
  TextEditingController modeloiocontrolador = new TextEditingController();
  TextEditingController fabricacionocontrolador = new TextEditingController();
  TextEditingController colorcontrolador = new TextEditingController();
  TextEditingController estadocontrolador = new TextEditingController();
  TextEditingController mecanicocontrolador = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 4, 37, 63),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 4, 37, 63),
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Registro de Vehiculos",
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ])),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12, 10, 12, 4),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Placa',
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
                    controller: placacontrolador,
                    decoration: InputDecoration(border: InputBorder.none),
                  )),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Usuario',
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
                    controller: usuariocontrolador,
                    decoration: InputDecoration(border: InputBorder.none),
                  )),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Marca',
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
                    controller: marcacontrolador,
                    decoration: InputDecoration(border: InputBorder.none),
                  )),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Modelo',
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
                    controller: modeloiocontrolador,
                    decoration: InputDecoration(border: InputBorder.none),
                  )),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Fecha de Fabricacion',
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
                    controller: fabricacionocontrolador,
                    decoration: InputDecoration(border: InputBorder.none),
                  )),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Color',
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
                    controller: colorcontrolador,
                    decoration: InputDecoration(border: InputBorder.none),
                  )),
              SizedBox(
                height: 15.0,
              ),
              
              Text(
                'Mecanico',
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
                    controller: mecanicocontrolador,
                    decoration: InputDecoration(border: InputBorder.none),
                  )),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      String id = randomAlphaNumeric(10);
                      Map<String, dynamic> autoinfoMap = {
                        "placa" : placacontrolador.text,
                        "usuario": usuariocontrolador.text,
                        "marca": marcacontrolador.text,
                        "modelo": modeloiocontrolador.text,
                        "fabricacion": fabricacionocontrolador.text,
                        "estado": "asignado",
                        "color": colorcontrolador.text,
                        "mecanico": mecanicocontrolador.text,
                      };
                      await DatabaseMethods()
                          .addauto(autoinfoMap, id)
                          .then((value) {
                        Fluttertoast.showToast(
                            msg: 'Vehiculo Registrado Correctamente');
                      });

                      placacontrolador.clear();
                      usuariocontrolador.clear();
                      marcacontrolador.clear();
                      modeloiocontrolador.clear();
                      fabricacionocontrolador.clear();
                      colorcontrolador.clear();
                      mecanicocontrolador.clear();
                    },
                    child: Text(
                      'Registrar',
                      style:
                          TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.bold),

                          
                    )),
              )
            ],
          ),
          ),
          ]
        )
          
        );
  }
}
