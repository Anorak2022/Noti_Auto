import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class formregistroauto extends StatelessWidget {
  const formregistroauto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 37, 63),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 37, 63),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text("Registro de Vehiculos",
            style: TextStyle(color: Colors.amber,
            fontSize: 24.0,
            fontWeight: FontWeight.bold),
            ),
            ]
            )
            ),
               body: Container(
              
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Usuario',
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0)),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      )
                      ),
                      Text('Marca',
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0)),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      )
                      ),
                      Text('Modelo',
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0)),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      )
                      ),
                      
                      Text('Fecha de Fabricacion',
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0)),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      )
                      ),
                      
                      Text('Color',
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0)),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      )
                      ),
                      
                      Text('Estado',
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0)),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      )
                      ),
                      
                      Text('Mecanico',
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0)),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      )
                      ),
                    const  SizedBox(height: 30),
                      Center(
                        child: ElevatedButton(onPressed: (){
                        
                        }, child: Text('Registrar',
                        style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold),)),
                      )


                  ],
                  ),
                
              
            )
            
            );
         
  }
}