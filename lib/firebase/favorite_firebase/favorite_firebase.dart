import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteFirebase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addFavorite(String doctorName) async {
    final String? userEmail = _auth.currentUser?.email;

    if (userEmail == null) {
      throw Exception("User not logged in");
    }

    final DocumentReference userDoc =
    _firestore.collection("favorites").doc(userEmail);

    await userDoc.set({
      "doctors": FieldValue.arrayUnion([doctorName]),
    }, SetOptions(merge: true));
  }


  Future<List<Map<String, dynamic>>> getDoctors() async {
    final String? userEmail = _auth.currentUser?.email;

    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('favorites')
          .doc(userEmail)
          .get();

      if (snapshot.exists) {
        List<dynamic> doctorNames = snapshot.get('doctors');

        // اجمع تفاصيل كل دكتور باستخدام أسمه
        List<Map<String, dynamic>> doctorList = [];

        for (String name in doctorNames) {
          QuerySnapshot querySnapshot = await FirebaseFirestore.instance
              .collection('doctors')
              .where('name', isEqualTo: name)
              .get();

          if (querySnapshot.docs.isNotEmpty) {
            doctorList.add(querySnapshot.docs.first.data() as Map<String, dynamic>);
          }
        }

        return doctorList;
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching doctors: $e');
      return [];
    }
  }

}
