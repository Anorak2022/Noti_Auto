import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noti_auto/autos/registro_auto.dart';
import 'package:noti_auto/registro.dart';

class mainauto extends StatelessWidget {
  mainauto({super.key});

  CollectionReference _autos = FirebaseFirestore.instance.collection("auto");
  @override
  Widget build(BuildContext context) {
    final User? usuario = FirebaseAuth.instance.currentUser;
    String? email = "";
    String? estado = "";

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
                     Navigator.push(context, MaterialPageRoute(builder: (context) => new formregistroauto()));
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
                        Widget estadocolor() {
                          if (estado == 'asignado') {
                            return Text(
                              "Estado: " + user['estado'],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 31, 179, 75), fontWeight: FontWeight.bold),
                            );
                          } else {
                            if(estado=='enproceso'){
                              return Text(
                               "Estado: " + user['estado'],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 212, 115, 4), fontWeight: FontWeight.bold),
                              );

                            }else{
                              if(estado=='finalizado'){
                                return Text(
                              "Estado: " + user['estado'],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 87, 201, 216), fontWeight: FontWeight.bold),
                            );
                              }
                            }

                              return Text('estado');
                   
                      
                          }
                        }

                        return Card(
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                    
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
                                      "Marca:" + user['marca'] + " Modelo :"+ user['modelo'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  Icon(Icons.edit, color: Colors.black,),

                                    estadocolor()

                                    ]
                                      
                                    )
                                    
                                    
                                    
                                  ],
                                ),
                              )
                            ],
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
