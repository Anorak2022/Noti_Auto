import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class usuariomenu extends StatefulWidget {
  const usuariomenu({super.key});



  @override
  State<usuariomenu> createState() => _usuariomenuState();
}



    

class _usuariomenuState extends State<usuariomenu> {
  @override



  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 37, 63) ,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 37, 63),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenido",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ) ,
      ),
      
    );
  }
}