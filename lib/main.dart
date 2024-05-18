import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:noti_auto/list_vehiculos.dart';
import 'package:noti_auto/menu_admin.dart';
import 'firebase_options.dart';


import 'package:noti_auto/inicio.dart';
import 'package:noti_auto/registro.dart';
import 'package:noti_auto/auxiliar.dart';
import 'package:google_sign_in/google_sign_in.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
); 
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    this._estaUsuarioAutenticado();
  }

  void _estaUsuarioAutenticado() {

    FirebaseAuth.instance.authStateChanges().listen( (User? user) {
      if (user == null)
        print ("Usuario no autenticado");
      else
        print ("Usuario autenticado");
    });
  }



  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: Login());

  }
}


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static bool _contrasenaVisible = false;
  static bool visible = false;
  static bool googleVisible = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;


  void initState() {
    super.initState();
    visible = false;
    googleVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromARGB(255, 4, 37, 63),
      body: Center(
        child: Container(
          child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 0.0),
                child: Text(
                  'Noti Auto',
                  style: TextStyle (
                    fontSize: 40,
                    color: Color.fromARGB(209, 206, 121, 25),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ),
        
              logo(),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Color.fromARGB(255, 224, 160, 21)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outline_rounded,
                        color:Color.fromARGB(255, 224, 160, 21),
                      ),
                      filled: true,
                      fillColor: Colors.black12,
                      labelStyle: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 224, 160, 21),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(20.0),
                        borderSide:
                        BorderSide(color: Color.fromARGB(255, 224, 160, 21)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Color.fromARGB(255, 224, 160, 21))
                        
                      ),
                      labelText: 'Email',
                      hintText: 'Email'),
                      
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 30.0),
                //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: TextFormField(
                  controller: _contrasenaController,
                  obscureText: !_contrasenaVisible,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(color:  Color.fromARGB(255, 224, 160, 21)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color:  Color.fromARGB(255, 224, 160, 21),
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(
                            _contrasenaVisible? Icons.visibility : Icons.visibility_off,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            setState(() {
                              _contrasenaVisible = !_contrasenaVisible;
                            });
                          }),
                      filled: true,
                      fillColor: Colors.black12,
                      labelStyle: TextStyle(
                        fontSize: 16,
                        color:  Color.fromARGB(255, 224, 160, 21),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(20.0),
                        borderSide:
                        BorderSide(color: Color.fromARGB(255, 224, 160, 21)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(20.0),
                        borderSide:
                        BorderSide(color:  Color.fromARGB(255, 224, 160, 21)),
                      ),
                      labelText: 'Contraseña',
                      hintText: 'Contraseña'),
                ),
              ),
              Container(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    if (!_emailController.text.contains('@')) {
                      mostrarSnackBar('Email no correcto', context);
                    } else if (_contrasenaController.text.length < 6) {
                      mostrarSnackBar(
                          'La contraseña debe contener al menos 6 caracteres',context);
                    } else {
                      setState(() {
                        _cambiarEstadoIndicadorProgreso();
                      });
                      acceder(context);

                    }
                  },
                  child: Text(
                    'Login',
                    //style: TextStyle(color: Colors.white, fontSize: 20,),
                    style: TextStyle(
                      fontSize: 19,
                      color: Color.fromARGB(255, 2, 2, 2),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 216, 160, 39), backgroundColor: const Color.fromARGB(209, 206, 121, 25),
                    shadowColor: Color.fromARGB(115, 8, 8, 8),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Colors.white70,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: visible,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                          width: 320,
                          margin: EdgeInsets.only(),
                          child: LinearProgressIndicator(
                            minHeight: 2,
                            backgroundColor: Colors.blueGrey[800],
                            valueColor:
                            AlwaysStoppedAnimation(Colors.white),
                          )
                      )
                  )
              ),
              Container(
                height: 30,
                width: 300,
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text(
                    '¿Olvidó la contraseña?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 350,
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _cambiarEstadoIndicadorProgresoGoogle();
                    });
                    accederGoogle(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Column(
                      children: <Widget>[
                        logogoogle(),

                        Padding(
                          padding:
                          const EdgeInsets.only(left: 40, right: 55),
                          child: Text(
                            'Acceder con Google',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              backgroundColor: Colors.transparent,
                              letterSpacing: 0.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 224, 160, 21), backgroundColor: Color.fromARGB(209, 206, 121, 25),
                    shadowColor: Colors.black45,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color.fromARGB(255, 211, 196, 163),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: googleVisible,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                          width: 320,
                          margin: EdgeInsets.only(bottom: 20),
                          child: LinearProgressIndicator(
                            minHeight: 2,
                            backgroundColor: Color.fromARGB(255, 61, 83, 94),
                            valueColor:
                            AlwaysStoppedAnimation(Color.fromARGB(255, 224, 160, 21)),
                          )))),
              Container(
                height: 30,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => PaginaRegistro()));

                  },

                  child: Text(
                    'Registrar',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

        )
        
    );
  }

String user="";
  Future<void> acceder(BuildContext context) async {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      try {
        UserCredential credencial = await auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _contrasenaController.text.trim()
         
        );
        user= _emailController.text.trim();
        if( user == "irvin@gmail.com"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => new adminmenu()));
        setState((){
          _cambiarEstadoIndicadorProgreso();
        }
        );
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => new Home()));

        }
      } on FirebaseAuthException catch(e) {
        if (e.code == "user-not-found")
          mostrarSnackBar("Usuario desconocido", context);
        else if (e.code == "wrong-password")
          mostrarSnackBar("Contraseña incorrecta", context);
        else
          mostrarSnackBar("Lo sentimos, hubo un error", context);
        setState((){
          _cambiarEstadoIndicadorProgreso();
        });
      }
    }
  }

  Future<void> accederGoogle(BuildContext context) async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {

      final GoogleSignInAccount? _googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication _googleSignInAuthentication = await _googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: _googleSignInAuthentication.accessToken,
        idToken: _googleSignInAuthentication.idToken
      );
      await _auth.signInWithCredential(credential);
      _formKey.currentState!.save();
      Navigator.push(context, MaterialPageRoute(builder: (context) => new Home()));

    } catch(e) {
      mostrarSnackBar("Lo sentimos, se produjo un error", context);
    } finally {
      setState((){
        _cambiarEstadoIndicadorProgresoGoogle();
      });

    }

  }

  void _cambiarEstadoIndicadorProgreso() {
    visible = !visible;
  }

  void _cambiarEstadoIndicadorProgresoGoogle() {
    googleVisible = !googleVisible;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }
Widget logo(){
  return const CircleAvatar(
                      radius: 99.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('images/logo.png'),
                    );
}

Widget logogoogle(){
  return const CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('images/google.png'),
                    );
}

}