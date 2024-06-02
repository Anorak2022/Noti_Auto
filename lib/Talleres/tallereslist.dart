import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noti_auto/Talleres/registrotaller.dart';
import 'package:noti_auto/autos/registro_auto.dart';
import 'package:noti_auto/registro.dart';
import 'package:noti_auto/services/firebase_services.dart';

class maintaller extends StatelessWidget {
  maintaller({super.key});

  CollectionReference _taller = FirebaseFirestore.instance.collection("taller");

  void _deletecar(String taller) {
    _taller.doc(taller).delete();
  }

  TextEditingController nombrecontrolador = new TextEditingController();
  TextEditingController direccioncontrolador = new TextEditingController();
  TextEditingController telefonoconotrolador = new TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    final User? usuario = FirebaseAuth.instance.currentUser;

    String? email = "";
   

    if (usuario != null) email = usuario.email;
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 37, 63),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 4, 37, 63),
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Listado de Talleres",
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
                      builder: (context) => new formregistrotaller()));
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
                  stream: _taller.snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var taller = snapshot.data!.docs[index];

                        Future talleredit(String id) => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content:  Container(
                                    child:  SingleChildScrollView(
                                      child:  Column(
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
                                            'Nombre',
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
                                                controller: nombrecontrolador,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              )),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Text(
                                            'Direccion',
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
                                                controller: direccioncontrolador,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              )),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Text(
                                            'Telefono',
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
                                                controller:telefonoconotrolador,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              )),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                         
                                          ElevatedButton(
                                            onPressed: ()async {
                                              Map<String, dynamic> updateinfo={
                                                'nombre': nombrecontrolador.text,
                                                'direccion':direccioncontrolador.text,
                                                'telefono': telefonoconotrolador.text,
                                                'id': id,

                                              };
                                              await DatabaseMethods().updatetaller(id, updateinfo).then((value){
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

                        

                        return Dismissible(
                          key: Key(taller.id),
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
                            _deletecar(taller.id);
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
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  
                                    children: [
                                      
                                      Row(
                                        
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        
                                          children: [
                                            Column(
                                              
                                              children: [
                                              Text(
                                              "Nombre:" + taller['nombre'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Direccion:" + taller['direccion'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Telefono:" +
                                                  taller['telefono'],
                                                 
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),

                                            Row(children: [
                                              IconButton(
                                                  onPressed: () {
                                                    nombrecontrolador.text =
                                                        taller['nombre'];
                                                    direccioncontrolador.text =
                                                        taller['direccion'];
                                                    telefonoconotrolador.text =
                                                        taller['telefono'];
                                                 
                                                    talleredit (taller["id"]);
                                                  },
                                                  icon: Icon(Icons.edit)),
                                              
                                            ])
                                          ])
                                    ],
                                  ),
                                    ]
                                )
                            )
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
