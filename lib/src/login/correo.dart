import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportsoccer/src/autenticador/email.dart';

// ignore: use_key_in_widget_constructors, camel_case_types
class Correo extends StatelessWidget {
  final correo = TextEditingController();
  final password = TextEditingController();
  final signEmail = email();

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
                      colors: [Colors.blue, Colors.blueGrey])),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                        onPressed: () async {
                          User? user = await signEmail.registroEmailPassword(
                              correo.text, password.text);
                          if (user != null) {
                            // ignore: avoid_print
                            print('registro exitoso');
                          } else {
                            // ignore: avoid_print
                            print('error al registro de usuarios');
                          }
                        },
                        child: Text('Iniciar Seccion'),
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
