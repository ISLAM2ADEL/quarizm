import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

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

  Future<List<String>> setSlots(String doctorName, String dayChosen) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collectionGroup('appointments')
          .where('doctor', isEqualTo: doctorName)
          .where('day', isEqualTo: dayChosen)
          .get();

      List<String> times = snapshot.docs
          .map((doc) => doc['time'] as String)
          .toList();

      print('Booked times for $doctorName on $dayChosen: $times');
      return times;
    } catch (e) {
      print('Error fetching slots: $e');
      return []; // في حالة الخطأ يرجع قائمة فاضية
    }
  }

  Future<void> scheduleAppointment(String doctorName, String pastDay,String pastTime,String dayChosen, String timeChosen) async {
    final String? userEmail = _auth.currentUser?.email;

    if (userEmail == null) {
      throw Exception("User not logged in");
    }

    final CollectionReference appointmentsSubcollection = _firestore
        .collection("appointments")
        .doc(userEmail)
        .collection("appointments");

    // Step 1: Check if there's already an appointment with the same doctor and day
    final QuerySnapshot existingAppointments = await appointmentsSubcollection
        .where("doctor", isEqualTo: doctorName)
        .where("day", isEqualTo: pastDay)
        .where("time", isEqualTo: pastTime)
        .limit(1)
        .get();

    if (existingAppointments.docs.isNotEmpty) {
      // Delete the old appointment
      final docId = existingAppointments.docs.first.id;
      await appointmentsSubcollection.doc(docId).delete();
    }

    // Add the new appointment
    await appointmentsSubcollection.add({
      "doctor": doctorName,
      "day": dayChosen,
      "time": timeChosen,
    });
  }

}