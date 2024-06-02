import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noti_auto/Talleres/tallereslist.dart';
import 'package:noti_auto/autos/mainauto.dart';
import 'package:noti_auto/autos/registro_auto.dart';
import 'package:noti_auto/main.dart';
import 'package:noti_auto/services/firebase_services.dart';
import 'package:noti_auto/usuario/mainusuario.dart';

class adminmenu extends StatefulWidget {
  const adminmenu({super.key});

  @override
  State<adminmenu> createState() => _adminmenuState();
}

// ignore: camel_case_types
class _adminmenuState extends State<adminmenu> {
  @override
  Widget build(BuildContext context) {

    final User? usuario = FirebaseAuth.instance.currentUser;
    String? email = "";

    if (usuario != null) email = usuario.email;
    print(email);

    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 60, 82, 99),
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                margin: const EdgeInsets.only(top: 50, bottom: 20),
                child: Image.asset('images/logo.png'),
              ),
              Text(
                'Bienvenido ' + email!,
                style: (TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Usuarios',
                    //style: TextStyle(color: Colors.white, fontSize: 20,),
                    style: TextStyle(
                      fontSize: 19,
                      color: Color.fromARGB(255, 2, 2, 2),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 216, 160, 39),
                    backgroundColor: const Color.fromARGB(209, 206, 121, 25),
                    shadowColor: Color.fromARGB(115, 8, 8, 8),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: const Color.fromARGB(179, 0, 0, 0),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
                Container(
                margin: EdgeInsets.only(top: 25),
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => new maintaller()));
                  },
                  child: Text(
                    'Talleres',
                    //style: TextStyle(color: Colors.white, fontSize: 20,),
                    style: TextStyle(
                      fontSize: 19,
                      color: Color.fromARGB(255, 2, 2, 2),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 216, 160, 39),
                    backgroundColor: const Color.fromARGB(209, 206, 121, 25),
                    shadowColor: Color.fromARGB(115, 8, 8, 8),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: const Color.fromARGB(179, 0, 0, 0),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
                Container(
                margin: EdgeInsets.only(top: 25),
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => new mainauto()));
                  },
                  child: Text(
                    'Autos',
                    //style: TextStyle(color: Colors.white, fontSize: 20,),
                    style: TextStyle(
                      fontSize: 19,
                      color: Color.fromARGB(255, 2, 2, 2),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 216, 160, 39),
                    backgroundColor: const Color.fromARGB(209, 206, 121, 25),
                    shadowColor: Color.fromARGB(115, 8, 8, 8),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: const Color.fromARGB(179, 0, 0, 0),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Mantenimientos',
                    //style: TextStyle(color: Colors.white, fontSize: 20,),
                    style: TextStyle(
                      fontSize: 19,
                      color: Color.fromARGB(255, 2, 2, 2),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 216, 160, 39),
                    backgroundColor: const Color.fromARGB(209, 206, 121, 25),
                    shadowColor: Color.fromARGB(115, 8, 8, 8),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: const Color.fromARGB(179, 0, 0, 0),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 75),
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    _salir(context);
                  },
                  child: Text(
                    'Cerrar Sesion',
                    //style: TextStyle(color: Colors.white, fontSize: 20,),
                    style: TextStyle(
                      fontSize: 19,
                      color: Color.fromARGB(255, 2, 2, 2),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 216, 160, 39),
                    backgroundColor: const Color.fromARGB(209, 206, 121, 25),
                    shadowColor: Color.fromARGB(115, 8, 8, 8),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: const Color.fromARGB(179, 0, 0, 0),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 37, 63),
      ),
      backgroundColor: Color.fromARGB(255, 4, 37, 63),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
        child: Column(
          children:[
            Material(
              elevation: 5,
              borderRadius:  BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white, 
                borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Text('Marca: Toyota', style: TextStyle(
                    color: Colors.white, 
                    fontSize: 20, 
                    fontWeight: FontWeight.bold),)
                ],),
              ),
            )
          ],
        ),)
    );
  }

  void _salir(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => MyApp()));
  }
}
