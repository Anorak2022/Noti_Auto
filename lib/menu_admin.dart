import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class adminmenu extends StatefulWidget {
  const adminmenu({super.key});

  @override
  State<adminmenu> createState() => _adminmenuState();
}

class _adminmenuState extends State<adminmenu> {



    

  @override
  Widget build(BuildContext context) {
    final User? usuario = FirebaseAuth.instance.currentUser;
    String? email = "";

     if (usuario!=null)
      email = usuario.email;
      print(email);
      
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 60, 82, 99),
          child: Column(children: [
            Container(
              child: Image.asset('images/logo.png'),
              
            )
          ],),
        ),

      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 37, 63),

      ),
      backgroundColor: Color.fromARGB(255, 4, 37, 63),
      body:  Center(
        child: Text('Bienvenido admin\n'+ email!),
        
      ),
    );
  }
}