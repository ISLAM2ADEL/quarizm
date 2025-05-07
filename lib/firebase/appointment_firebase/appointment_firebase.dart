import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppointmentFirebase{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addAppointment(String doctorName, String dayChosen, String timeChosen) async {
    final String? userEmail = _auth.currentUser?.email;

    if (userEmail == null) {
      throw Exception("User not logged in");
    }

    final CollectionReference appointmentsSubcollection = _firestore
        .collection("appointments")
        .doc(userEmail)
        .collection("appointments");

    await appointmentsSubcollection.add({
      "doctor": doctorName,
      "day": dayChosen,
      "time": timeChosen,
    });
  }
}