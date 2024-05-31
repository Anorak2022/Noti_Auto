import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noti_auto/autos/registro_auto.dart';
import 'package:noti_auto/registro.dart';
import 'package:noti_auto/services/firebase_services.dart';
import 'package:noti_auto/usuario/agregarautousuario.dart';

class mainusuario extends StatelessWidget {
  mainusuario({super.key});

  CollectionReference _autos = FirebaseFirestore.instance.collection("auto");

  void _deletecar(String user) {
    _autos.doc(user).delete();
  }

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
    final User? usuario = FirebaseAuth.instance.currentUser;

    String? email = "";
    String? estado = "";
    String? useriid = "";
    String? mecanico="";

    if (usuario != null) email = usuario.email;
    print(email);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 37, 63),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 4, 37, 63),
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Listado de Vehiculos",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ])),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new formregistroautouser()));
            },
            child: Text(
              'agregar',
              //style: TextStyle(color: Colors.white, fontSize: 20,),
              style: TextStyle(
                fontSize: 19,
                color: Color.fromARGB(255, 2, 2, 2),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
              child: StreamBuilder(
                  stream: _autos.snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var user = snapshot.data!.docs[index];
                        estado = user['estado'];
                        useriid = user['usuario'];
                        mecanico = user['mecanico'];

                        Future editcars(String id) => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Container(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Icon(Icons.cancel),
                                              )
                                            ],
                                          ),
                                          Text(
                                            'Placa',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Container(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 0, 0, 0)),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: TextField(
                                                style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                                controller: placacontrolador,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              )),
                                        
                                   
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Text(
                                            'Marca',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
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
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: TextField(
                                                style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                                controller: marcacontrolador,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              )),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Text(
                                            'Modelo',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Container(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: TextField(
                                                style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                                controller: modeloiocontrolador,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              )),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Text(
                                            'Fecha de Fabricacion',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Container(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: TextField(
                                                controller:
                                                    fabricacionocontrolador,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              )),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Text(
                                            'Color',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Container(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: TextField(
                                                style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                                controller: colorcontrolador,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              )),
                                  
                                          SizedBox(
                                            height: 15,
                                          ),
                                          ElevatedButton(
                                            onPressed: () async {
                                              Map<String, dynamic> updateinfo =
                                                  {
                                                'placa': placacontrolador.text,
                                                'usuario':
                                                    email,
                                                'marca': marcacontrolador.text,
                                                'modelo':
                                                    modeloiocontrolador.text,
                                                'fabricacion':
                                                    fabricacionocontrolador
                                                        .text,
                                                'color': colorcontrolador.text,
                                                'estado':
                                                    estado,
                                                'mecanico':
                                                    mecanico,
                                                'id': id,
                                              };
                                              await DatabaseMethods()
                                                  .updatecars(id, updateinfo)
                                                  .then((value) {
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text(
                                              'Actualizar',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Color.fromARGB(
                                                  255, 216, 160, 39),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      209, 206, 121, 25),
                                              shadowColor:
                                                  Color.fromARGB(115, 8, 8, 8),
                                              elevation: 8,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: BorderSide(
                                                  color: const Color.fromARGB(
                                                      179, 0, 0, 0),
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));

                        Widget estadocolores() {
                          if (estado == 'asignado' || estado=='Creado') {
                            return Text("Estado: " + user['estado'],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 31, 179, 75),
                                    fontWeight: FontWeight.bold));
                          } else {
                            if (estado == 'enproceso') {
                              return Text(
                                "Estado: " + user['estado'],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 212, 115, 4),
                                    fontWeight: FontWeight.bold),
                              );
                            } else {
                              if (estado == 'finalizado') {
                                return Text(
                                  "Estado: " + user['estado'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 87, 201, 216),
                                      fontWeight: FontWeight.bold),
                                );
                              }
                            }
                          }
                          return Text(estado!);
                        }

                        Widget mostrarinfo() {
                          if (email == useriid) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(children: [
                                  Text(
                                    "Placa:" + user['placa'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Usuario:" + user['usuario'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Marca:" +
                                        user['marca'] +
                                        " Modelo :" +
                                        user['modelo'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(children: [
                                    IconButton(
                                        onPressed: () {
                                          placacontrolador.text = user['placa'];
                                          usuariocontrolador.text =
                                              user['usuario'];
                                          marcacontrolador.text = user['marca'];
                                          modeloiocontrolador.text =
                                              user['modelo'];
                                          fabricacionocontrolador.text =
                                              user['fabricacion'];
                                          colorcontrolador.text = user['color'];
                                          mecanicocontrolador.text =
                                              user['mecanico'];
                                          estadocontrolador.text =
                                              user['estado'];

                                          editcars(user["id"]);
                                        },
                                        icon: Icon(Icons.edit)),
                                    estadocolores()
                                  ])
                                ])
                              ],
                            );
                          }
                          return Divider(
                            height: 0,
                          );
                        }

                        return Dismissible(
                          key: Key(user.id),
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (direction) {
                            _deletecar(user.id);
                          },
                          direction: DismissDirection.endToStart,
                          child: Card(
                            elevation: 4,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [mostrarinfo()]))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }))
        ]),
      ),
    );
  }
}
