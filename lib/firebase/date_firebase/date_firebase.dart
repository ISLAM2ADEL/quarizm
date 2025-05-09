

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DateFirebase{

  Future<List<Map<String, dynamic>>> getDates() async {
    String? email = FirebaseAuth.instance.currentUser?.email;

    if (email == null) throw Exception("User not signed in");

    CollectionReference appointmentsRef = FirebaseFirestore.instance
        .collection('appointments')
        .doc(email)
        .collection('appointments');

    QuerySnapshot snapshot = await appointmentsRef.get();

    List<Map<String, dynamic>> allAppointments = snapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();

    return allAppointments;
  }

  Future<void> cancelAppointment(String day, String time) async {
    String? email = FirebaseAuth.instance.currentUser?.email;
    if (email == null) throw Exception("User not signed in");

    CollectionReference appointmentsRef = FirebaseFirestore.instance
        .collection('appointments')
        .doc(email)
        .collection('appointments');

    QuerySnapshot snapshot = await appointmentsRef.get();

    for (var doc in snapshot.docs) {
      Map<String, dynamic> appointment = doc.data() as Map<String, dynamic>;
      if (appointment['day'] == day && appointment['time'] == time) {
        await appointmentsRef.doc(doc.id).delete();
        break;
      }
    }
  }
}