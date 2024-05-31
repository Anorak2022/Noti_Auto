import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:noti_auto/main.dart';
import 'package:noti_auto/usuario/agregarautousuario.dart';
import 'package:noti_auto/usuario/mainusuario.dart';
import 'package:noti_auto/usuario/usuariomenu.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final User? usuario = FirebaseAuth.instance.currentUser;
    String? email = "";

    if (usuario != null) email = usuario.email;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 37, 63),
      ),
      backgroundColor: Color.fromARGB(255, 4, 37, 63),
      body: Container(
        
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
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
                style: (TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                color: Colors.white)),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => new mainusuario()));
                  },
                  child: Text(
                    'Mis Autos',
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
                  onPressed: () {},
                  child: Text(
                    'Mi Perfil',
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

        ]
        )
        )

    );
  }

  void _salir(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }
}
