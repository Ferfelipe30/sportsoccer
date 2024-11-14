// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void guardarDatos(User user) {
  FirebaseFirestore.instance.collection('users').doc(user.uid).set({
    'nombre': user.displayName,
    'email': user.email,
    'photoURL': user.photoURL,
    'phoneNumber': user.phoneNumber,
    'provider': user.providerData.map((e) => e.providerId).join(', ')
  });
}
