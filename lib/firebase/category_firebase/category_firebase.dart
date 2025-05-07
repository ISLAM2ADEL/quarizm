import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryFirebase {

  // Future<void> addMedicalCategories() async {
  //   final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  //   // لستة التصنيفات مع الصور
  //   List<Map<String, String>> categories = [
  //     {'name': 'Cardiologist', 'image': 'assets/images/cardiologist.png'},
  //     {'name': 'Dermatologist', 'image': 'assets/images/dermatologist.png'},
  //     {'name': 'Pediatrician', 'image': 'assets/images/pediatrician.png'},
  //     {'name': 'Dentist', 'image': 'assets/images/dentist.png'},
  //     {'name': 'Psychiatrist', 'image': 'assets/images/psychiatrist.png'},
  //     {'name': 'Neurologist', 'image': 'assets/images/neurologist.png'},
  //     {'name': 'Orthopedic', 'image': 'assets/images/orthopedic.png'},
  //     {'name': 'Ophthalmologist', 'image': 'assets/images/ophthalmologist.png'},
  //     {'name': 'Gynecologist', 'image': 'assets/images/gynecologist.png'},
  //     {'name': 'Oncologist', 'image': 'assets/images/oncologist.png'},
  //     {'name': 'General Physician', 'image': 'assets/images/general_physician.png'},
  //     {'name': 'ENT Specialist', 'image': 'assets/images/ent.png'},
  //     {'name': 'Urologist', 'image': 'assets/images/urologist.png'},
  //     {'name': 'Gastroenterologist', 'image': 'assets/images/gastro.png'},
  //     {'name': 'Allergist', 'image': 'assets/images/allergist.png'},
  //     {'name': 'Endocrinologist', 'image': 'assets/images/endocrinologist.png'},
  //     {'name': 'Pulmonologist', 'image': 'assets/images/pulmonologist.png'},
  //     {'name': 'Rheumatologist', 'image': 'assets/images/rheumatologist.png'},
  //     {'name': 'Surgeon', 'image': 'assets/images/surgeon.png'},
  //     {'name': 'Nephrologist', 'image': 'assets/images/nephrologist.png'},
  //   ];
  //
  //   try {
  //     for (var category in categories) {
  //       await firestore.collection('categories').add({
  //         'name': category['name'],
  //         'image': category['image'],
  //       });
  //     }
  //     print('Categories with images added successfully!');
  //   } catch (e) {
  //     print('Error adding categories: $e');
  //   }
  // }


  Future<List<Map<String, dynamic>>> getCategories() async {
    try {
      final QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('categories').get();

      List<Map<String, dynamic>> categoryList = snapshot.docs
          .map((doc) => {
        'name': doc['name'],
        'image': doc['image'],
      })
          .toList();

      return categoryList;
    } catch (e) {
      print('Error getting categories: $e');
      return [];
    }

  }

  Future<List<Map<String, dynamic>>> getCategoryByName({String? startsWith}) async {
    try {
      final QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('categories').get();

      List<Map<String, dynamic>> categoryList = snapshot.docs
          .map((doc) => {
        'name': doc['name'],
        'image': doc['image'],
      })
          .toList();

      if (startsWith != null && startsWith.isNotEmpty) {
        final lowerPrefix = startsWith.toLowerCase();
        categoryList = categoryList
            .where((category) =>
            category['name'].toString().toLowerCase().startsWith(lowerPrefix))
            .toList();
      }

      return categoryList;
    } catch (e) {
      print('Error getting categories: $e');
      return [];
    }
  }

}