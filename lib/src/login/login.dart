import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportsoccer/src/autenticador/email.dart';
import 'package:sportsoccer/src/autenticador/facebook.dart';
import 'package:sportsoccer/src/autenticador/google.dart';
import 'package:sportsoccer/src/autenticador/guardarDatos.dart';
import 'package:sportsoccer/src/home/home.dart';
import 'package:sportsoccer/src/login/correo.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => loginPage();
}

// ignore: camel_case_types
class loginPage extends State<login> {
  final correo = TextEditingController();
  final password = TextEditingController();
  final login = email();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue,
                    Colors.blueGrey,
                  ],
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'imagen/logo.webp',
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        maxLines: 1,
                        controller: correo,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Correo',
                          filled: true,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        maxLines: 1,
                        controller: password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          filled: true,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () async {
                          User? user = await login.loginEmailPassword(
                              correo.text, password.text);
                          if (user != null) {
                            // ignore: avoid_print
                            print('Inicio de sesion exitoso');
                            // ignore: use_build_context_synchronously
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => home()));
                          } else {
                            // ignore: avoid_print
                            print('Error al inicio de sesion');
                          }
                        },
                        child: Text('Iniciar Sesion'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(255, 167, 0, 1),
                          foregroundColor: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        onPressed: () async {
                          final user = await google();
                          if (user != null) guardarDatos(user);
                          // ignore: use_build_context_synchronously
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => home()));
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        label: Text(
                          'Iniciar Seccion con Google',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              FloatingActionButton(
                                backgroundColor: Colors.blue,
                                onPressed: () async {
                                  User? user = await iniciarSesionFacebook();
                                  if (user != null) {
                                    // ignore: avoid_print
                                    print(
                                        'Iniciar sesion exitoso: ${user.displayName}');
                                  } else {
                                    // ignore: avoid_print
                                    print('Iniciar sesion cancelado o fallido');
                                  }
                                },
                                child: Icon(
                                  Icons.facebook,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              FloatingActionButton(
                                backgroundColor: Colors.amber,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Correo()));
                                },
                                child: Icon(
                                  Icons.email_rounded,
                                  size: 50,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Olvide la contraseña',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
