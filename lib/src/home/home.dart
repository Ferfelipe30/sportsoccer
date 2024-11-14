import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => homePage();
}

// ignore: camel_case_types
class homePage extends State<home> {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  List<Map<dynamic, dynamic>> dataList = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    databaseReference.child("tu_nodo").onValue.listen((DatabaseEvent event) {
      final dataSnapshot = event.snapshot;
      final Map<dynamic, dynamic>? values =
          dataSnapshot.value as Map<dynamic, dynamic>?;
      if (values != null) {
        dataList.clear(); // Limpiar la lista antes de agregar nuevos datos
        values.forEach((key, value) {
          dataList.add(value as Map<dynamic, dynamic>);
        });
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de Firebase Realtime Database'),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final data = dataList[index];
          return ListTile(
            title: Text(data['nombre'] ?? 'Nombre no disponible'),
            subtitle: Text(data['descripcion'] ?? 'Descripción no disponible'),
          );
        },
      ),
    );
  }
}
