import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorFirebase {

  // Future<void> addDoctors() async {
  //   final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  //   List<Map<String, dynamic>> doctors = [
  //     {
  //       "name": "Ahmed Youssef",
  //       "age": 45,
  //       "gender": "Male",
  //       "experience": 20,
  //       "bio": "Cardiologist with a passion for patient-centered care.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor2_rbeoox.png",
  //       "category": "Cardiologist",
  //       "workingDays": ["Sunday", "Monday", "Thursday"],
  //       "startHour": "09:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Mariam El-Sayed",
  //       "age": 38,
  //       "gender": "Female",
  //       "experience": 14,
  //       "bio": "Experienced dermatologist specializing in acne and skin care.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor3_z9zzbu.png",
  //       "category": "Dermatologist",
  //       "workingDays": ["Saturday", "Tuesday"],
  //       "startHour": "10:00",
  //       "endHour": "15:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Hossam Khaled",
  //       "age": 50,
  //       "gender": "Male",
  //       "experience": 25,
  //       "bio": "Renowned pediatrician who loves working with children.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor5_fw1tet.png",
  //       "category": "Pediatrician",
  //       "workingDays": ["Sunday", "Wednesday"],
  //       "startHour": "08:00",
  //       "endHour": "12:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Salma Ibrahim",
  //       "age": 34,
  //       "gender": "Female",
  //       "experience": 10,
  //       "bio": "Dentist with a gentle touch and a smile for every patient.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor4_doga28.png",
  //       "category": "Dentist",
  //       "workingDays": ["Monday", "Thursday"],
  //       "startHour": "13:00",
  //       "endHour": "17:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Mahmoud Fathy",
  //       "age": 42,
  //       "gender": "Male",
  //       "experience": 17,
  //       "bio": "Psychiatrist focusing on mental wellness and therapy.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor4_fb8lrm.png",
  //       "category": "Psychiatrist",
  //       "workingDays": ["Sunday", "Tuesday", "Friday"],
  //       "startHour": "10:00",
  //       "endHour": "16:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Nada Adel",
  //       "age": 36,
  //       "gender": "Female",
  //       "experience": 12,
  //       "bio": "Neurologist with expertise in migraines and stroke.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor1_m9pcl6.png",
  //       "category": "Neurologist",
  //       "workingDays": ["Wednesday", "Saturday"],
  //       "startHour": "11:00",
  //       "endHour": "15:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Tarek Hassan",
  //       "age": 47,
  //       "gender": "Male",
  //       "experience": 22,
  //       "bio": "Orthopedic surgeon with years of trauma surgery experience.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor3_sp07xi.png",
  //       "category": "Orthopedic",
  //       "workingDays": ["Sunday", "Thursday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Reem Farouk",
  //       "age": 40,
  //       "gender": "Female",
  //       "experience": 15,
  //       "bio": "Ophthalmologist dedicated to preserving vision and eye health.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor2_mqjlbn.png",
  //       "category": "Ophthalmologist",
  //       "workingDays": ["Tuesday", "Wednesday"],
  //       "startHour": "12:00",
  //       "endHour": "16:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Samir Nabil",
  //       "age": 52,
  //       "gender": "Male",
  //       "experience": 28,
  //       "bio": "Gynecologist focused on women's health and wellness.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor1_hcgs72.png",
  //       "category": "Gynecologist",
  //       "workingDays": ["Monday", "Thursday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Rania Magdy",
  //       "age": 33,
  //       "gender": "Female",
  //       "experience": 9,
  //       "bio": "Oncologist passionate about cancer research and patient care.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor5_up8deq.png",
  //       "category": "Oncologist",
  //       "workingDays": ["Saturday", "Sunday"],
  //       "startHour": "11:00",
  //       "endHour": "15:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Nader Helmy",
  //       "age": 44,
  //       "gender": "Male",
  //       "experience": 19,
  //       "bio": "General physician with extensive experience in family medicine.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor2_rbeoox.png",
  //       "category": "General Physician",
  //       "workingDays": ["Monday", "Wednesday"],
  //       "startHour": "08:00",
  //       "endHour": "13:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Yasmine Tarek",
  //       "age": 37,
  //       "gender": "Female",
  //       "experience": 11,
  //       "bio": "ENT specialist treating all ear, nose, and throat conditions.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor3_z9zzbu.png",
  //       "category": "ENT Specialist",
  //       "workingDays": ["Tuesday", "Friday"],
  //       "startHour": "10:00",
  //       "endHour": "14:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Osama Galal",
  //       "age": 49,
  //       "gender": "Male",
  //       "experience": 23,
  //       "bio": "Urologist with a focus on kidney and urinary tract health.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor5_fw1tet.png",
  //       "category": "Urologist",
  //       "workingDays": ["Sunday", "Thursday"],
  //       "startHour": "12:00",
  //       "endHour": "16:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Rasha Kamal",
  //       "age": 35,
  //       "gender": "Female",
  //       "experience": 10,
  //       "bio": "Gastroenterologist with a love for gut health education.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor4_doga28.png",
  //       "category": "Gastroenterologist",
  //       "workingDays": ["Monday", "Saturday"],
  //       "startHour": "09:00",
  //       "endHour": "13:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Khaled Ezz",
  //       "age": 46,
  //       "gender": "Male",
  //       "experience": 20,
  //       "bio": "Allergist helping patients manage seasonal and food allergies.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor4_fb8lrm.png",
  //       "category": "Allergist",
  //       "workingDays": ["Wednesday", "Friday"],
  //       "startHour": "08:30",
  //       "endHour": "12:30",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Lina Zaki",
  //       "age": 39,
  //       "gender": "Female",
  //       "experience": 13,
  //       "bio": "Endocrinologist focusing on diabetes and hormonal health.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor1_m9pcl6.png",
  //       "category": "Endocrinologist",
  //       "workingDays": ["Tuesday", "Thursday"],
  //       "startHour": "11:00",
  //       "endHour": "15:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Ehab Lotfy",
  //       "age": 48,
  //       "gender": "Male",
  //       "experience": 21,
  //       "bio": "Pulmonologist specializing in asthma and respiratory diseases.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor3_sp07xi.png",
  //       "category": "Pulmonologist",
  //       "workingDays": ["Sunday", "Wednesday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Farida El-Sherbiny",
  //       "age": 41,
  //       "gender": "Female",
  //       "experience": 16,
  //       "bio": "Rheumatologist helping patients with joint pain and arthritis.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor2_mqjlbn.png",
  //       "category": "Rheumatologist",
  //       "workingDays": ["Monday", "Thursday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Adel Shokry",
  //       "age": 55,
  //       "gender": "Male",
  //       "experience": 30,
  //       "bio": "Veteran surgeon with expertise in general and laparoscopic surgeries.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor1_hcgs72.png",
  //       "category": "Surgeon",
  //       "workingDays": ["Tuesday", "Friday"],
  //       "startHour": "08:00",
  //       "endHour": "12:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Inas Ghoneim",
  //       "age": 43,
  //       "gender": "Female",
  //       "experience": 18,
  //       "bio": "Nephrologist dedicated to kidney health and dialysis care.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor5_up8deq.png",
  //       "category": "Nephrologist",
  //       "workingDays": ["Saturday", "Monday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Nourhan Sami",
  //       "age": 37,
  //       "gender": "Female",
  //       "experience": 12,
  //       "bio": "Radiologist passionate about advanced imaging techniques.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor2_mqjlbn.png",
  //       "category": "Radiologist",
  //       "workingDays": ["Sunday", "Wednesday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Mostafa Galal",
  //       "age": 50,
  //       "gender": "Male",
  //       "experience": 25,
  //       "bio": "Internist focused on chronic disease management.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor4_fb8lrm.png",
  //       "category": "Internist",
  //       "workingDays": ["Tuesday", "Friday"],
  //       "startHour": "09:30",
  //       "endHour": "13:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Dalia Hisham",
  //       "age": 32,
  //       "gender": "Female",
  //       "experience": 8,
  //       "bio": "Nutritionist dedicated to helping patients eat healthier.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor5_up8deq.png",
  //       "category": "Nutritionist",
  //       "workingDays": ["Monday", "Thursday"],
  //       "startHour": "11:00",
  //       "endHour": "15:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Amr Lotfy",
  //       "age": 46,
  //       "gender": "Male",
  //       "experience": 21,
  //       "bio": "Hematologist with a strong research background.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor3_sp07xi.png",
  //       "category": "Hematologist",
  //       "workingDays": ["Wednesday", "Saturday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Yasmin Fawzy",
  //       "age": 40,
  //       "gender": "Female",
  //       "experience": 15,
  //       "bio": "Obstetrician who ensures a safe pregnancy and delivery.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor1_m9pcl6.png",
  //       "category": "Obstetrician",
  //       "workingDays": ["Sunday", "Tuesday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Sherif Kamal",
  //       "age": 43,
  //       "gender": "Male",
  //       "experience": 18,
  //       "bio": "Anesthesiologist ensuring patient comfort and safety.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor1_hcgs72.png",
  //       "category": "Anesthesiologist",
  //       "workingDays": ["Monday", "Friday"],
  //       "startHour": "08:30",
  //       "endHour": "12:30",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Rana Maher",
  //       "age": 36,
  //       "gender": "Female",
  //       "experience": 11,
  //       "bio": "Occupational therapist supporting functional independence.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor4_doga28.png",
  //       "category": "Occupational Therapist",
  //       "workingDays": ["Wednesday", "Friday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Hazem Fouad",
  //       "age": 38,
  //       "gender": "Male",
  //       "experience": 13,
  //       "bio": "Sports medicine specialist promoting athletic health.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor2_rbeoox.png",
  //       "category": "Sports Medicine",
  //       "workingDays": ["Tuesday", "Saturday"],
  //       "startHour": "12:00",
  //       "endHour": "16:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Dina Helal",
  //       "age": 34,
  //       "gender": "Female",
  //       "experience": 10,
  //       "bio": "Pathologist with a deep interest in disease diagnosis.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor3_z9zzbu.png",
  //       "category": "Pathologist",
  //       "workingDays": ["Monday", "Thursday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Yasser Sabry",
  //       "age": 45,
  //       "gender": "Male",
  //       "experience": 20,
  //       "bio": "Immunologist passionate about autoimmune diseases.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor5_fw1tet.png",
  //       "category": "Immunologist",
  //       "workingDays": ["Sunday", "Wednesday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Hadeer Lotfy",
  //       "age": 31,
  //       "gender": "Female",
  //       "experience": 6,
  //       "bio": "Speech therapist working with all age groups.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor2_mqjlbn.png",
  //       "category": "Speech Therapist",
  //       "workingDays": ["Tuesday", "Friday"],
  //       "startHour": "11:00",
  //       "endHour": "15:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Magdy Zidan",
  //       "age": 53,
  //       "gender": "Male",
  //       "experience": 28,
  //       "bio": "Emergency medicine expert with trauma care expertise.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor4_fb8lrm.png",
  //       "category": "Emergency Medicine",
  //       "workingDays": ["Saturday", "Wednesday"],
  //       "startHour": "08:00",
  //       "endHour": "12:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Hanan El-Masry",
  //       "age": 39,
  //       "gender": "Female",
  //       "experience": 14,
  //       "bio": "Podiatrist dedicated to foot and ankle health.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor5_up8deq.png",
  //       "category": "Podiatrist",
  //       "workingDays": ["Monday", "Thursday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Khaled Ragab",
  //       "age": 42,
  //       "gender": "Male",
  //       "experience": 17,
  //       "bio": "Plastic surgeon focused on reconstructive procedures.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor3_sp07xi.png",
  //       "category": "Plastic Surgeon",
  //       "workingDays": ["Tuesday", "Friday"],
  //       "startHour": "11:00",
  //       "endHour": "15:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Eman Abdelrahman",
  //       "age": 35,
  //       "gender": "Female",
  //       "experience": 9,
  //       "bio": "Geneticist with a background in hereditary diseases.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor1_m9pcl6.png",
  //       "category": "Geneticist",
  //       "workingDays": ["Sunday", "Thursday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Maged Soliman",
  //       "age": 48,
  //       "gender": "Male",
  //       "experience": 22,
  //       "bio": "Otolaryngologist with interest in voice disorders.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor1_hcgs72.png",
  //       "category": "Otolaryngologist",
  //       "workingDays": ["Wednesday", "Saturday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Hala Tawfik",
  //       "age": 41,
  //       "gender": "Female",
  //       "experience": 16,
  //       "bio": "Audiologist helping patients with hearing loss.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor4_doga28.png",
  //       "category": "Audiologist",
  //       "workingDays": ["Monday", "Friday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Ashraf Said",
  //       "age": 44,
  //       "gender": "Male",
  //       "experience": 19,
  //       "bio": "Critical care specialist with intensive care expertise.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor2_rbeoox.png",
  //       "category": "Critical Care",
  //       "workingDays": ["Tuesday", "Thursday"],
  //       "startHour": "08:30",
  //       "endHour": "12:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Hiba Adel",
  //       "age": 30,
  //       "gender": "Female",
  //       "experience": 5,
  //       "bio": "Young and passionate occupational health specialist.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor3_z9zzbu.png",
  //       "category": "Occupational Health",
  //       "workingDays": ["Wednesday", "Friday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Sherif Abdelrahim",
  //       "age": 51,
  //       "gender": "Male",
  //       "experience": 26,
  //       "bio": "Experienced forensic pathologist with legal expertise.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor5_fw1tet.png",
  //       "category": "Forensic Pathologist",
  //       "workingDays": ["Sunday", "Tuesday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Laila Hassan",
  //       "age": 38,
  //       "gender": "Female",
  //       "experience": 13,
  //       "bio": "Dermatologist helping patients achieve healthy skin.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor5_up8deq.png",
  //       "category": "Dermatologist",
  //       "workingDays": ["Monday", "Thursday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Omar Nabil",
  //       "age": 36,
  //       "gender": "Male",
  //       "experience": 11,
  //       "bio": "Endocrinologist specializing in diabetes and metabolism.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor4_fb8lrm.png",
  //       "category": "Endocrinologist",
  //       "workingDays": ["Sunday", "Tuesday"],
  //       "startHour": "09:30",
  //       "endHour": "13:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Fatma Rashed",
  //       "age": 42,
  //       "gender": "Female",
  //       "experience": 17,
  //       "bio": "Family medicine doctor with a holistic approach.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor1_m9pcl6.png",
  //       "category": "Family Medicine",
  //       "workingDays": ["Wednesday", "Saturday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Ahmed ElSharkawy",
  //       "age": 40,
  //       "gender": "Male",
  //       "experience": 15,
  //       "bio": "Pulmonologist with focus on asthma and COPD.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor2_rbeoox.png",
  //       "category": "Pulmonologist",
  //       "workingDays": ["Tuesday", "Friday"],
  //       "startHour": "11:00",
  //       "endHour": "15:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Salma Gabr",
  //       "age": 35,
  //       "gender": "Female",
  //       "experience": 10,
  //       "bio": "Geriatrician caring for older adults with compassion.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor3_z9zzbu.png",
  //       "category": "Geriatrician",
  //       "workingDays": ["Sunday", "Wednesday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Ibrahim Hafez",
  //       "age": 47,
  //       "gender": "Male",
  //       "experience": 22,
  //       "bio": "Cardiothoracic surgeon with decades of operating experience.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor5_fw1tet.png",
  //       "category": "Cardiothoracic Surgeon",
  //       "workingDays": ["Monday", "Thursday"],
  //       "startHour": "08:30",
  //       "endHour": "12:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Reem ElBaz",
  //       "age": 33,
  //       "gender": "Female",
  //       "experience": 8,
  //       "bio": "Allergist helping patients manage allergies and asthma.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor4_doga28.png",
  //       "category": "Allergist",
  //       "workingDays": ["Tuesday", "Saturday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 20
  //     },
  //     {
  //       "name": "Mahmoud Khalil",
  //       "age": 39,
  //       "gender": "Male",
  //       "experience": 14,
  //       "bio": "Oncologist specializing in early cancer detection.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor3_sp07xi.png",
  //       "category": "Oncologist",
  //       "workingDays": ["Monday", "Friday"],
  //       "startHour": "09:30",
  //       "endHour": "13:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Hana Fouad",
  //       "age": 34,
  //       "gender": "Female",
  //       "experience": 9,
  //       "bio": "Psychiatrist offering support for mental wellness.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor2_mqjlbn.png",
  //       "category": "Psychiatrist",
  //       "workingDays": ["Sunday", "Thursday"],
  //       "startHour": "11:00",
  //       "endHour": "15:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Basel Tarek",
  //       "age": 45,
  //       "gender": "Male",
  //       "experience": 20,
  //       "bio": "Vascular surgeon focused on artery and vein health.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor1_hcgs72.png",
  //       "category": "Vascular Surgeon",
  //       "workingDays": ["Wednesday", "Saturday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Dalia Wahba",
  //       "age": 37,
  //       "gender": "Female",
  //       "experience": 12,
  //       "bio": "Gynecologist passionate about women's health.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor5_up8deq.png",
  //       "category": "Gynecologist",
  //       "workingDays": ["Tuesday", "Friday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Hossam ElShenawy",
  //       "age": 43,
  //       "gender": "Male",
  //       "experience": 18,
  //       "bio": "Neonatologist ensuring newborns receive excellent care.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor4_fb8lrm.png",
  //       "category": "Neonatologist",
  //       "workingDays": ["Monday", "Thursday"],
  //       "startHour": "08:00",
  //       "endHour": "12:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Samar Youssef",
  //       "age": 31,
  //       "gender": "Female",
  //       "experience": 6,
  //       "bio": "Rehabilitation specialist helping patients recover mobility.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor1_m9pcl6.png",
  //       "category": "Rehabilitation Medicine",
  //       "workingDays": ["Sunday", "Wednesday"],
  //       "startHour": "10:30",
  //       "endHour": "14:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Rami Aziz",
  //       "age": 50,
  //       "gender": "Male",
  //       "experience": 25,
  //       "bio": "Orthopedic surgeon with experience in joint replacement.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor2_rbeoox.png",
  //       "category": "Orthopedic Surgeon",
  //       "workingDays": ["Tuesday", "Friday"],
  //       "startHour": "11:00",
  //       "endHour": "15:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Hend Refaat",
  //       "age": 36,
  //       "gender": "Female",
  //       "experience": 11,
  //       "bio": "Nephrologist focused on kidney health and dialysis care.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor3_z9zzbu.png",
  //       "category": "Nephrologist",
  //       "workingDays": ["Monday", "Saturday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Mounir Saad",
  //       "age": 48,
  //       "gender": "Male",
  //       "experience": 23,
  //       "bio": "Urologist managing urinary and reproductive issues.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor5_fw1tet.png",
  //       "category": "Urologist",
  //       "workingDays": ["Sunday", "Thursday"],
  //       "startHour": "09:30",
  //       "endHour": "13:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Nada Sami",
  //       "age": 29,
  //       "gender": "Female",
  //       "experience": 4,
  //       "bio": "Young pediatrician with a passion for child care.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor4_doga28.png",
  //       "category": "Pediatrician",
  //       "workingDays": ["Wednesday", "Friday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Tarek El Adly",
  //       "age": 46,
  //       "gender": "Male",
  //       "experience": 21,
  //       "bio": "Neurosurgeon with a focus on brain and spine surgeries.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor3_sp07xi.png",
  //       "category": "Neurosurgeon",
  //       "workingDays": ["Monday", "Thursday"],
  //       "startHour": "08:00",
  //       "endHour": "12:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Shaimaa Ghoneim",
  //       "age": 33,
  //       "gender": "Female",
  //       "experience": 8,
  //       "bio": "Rheumatologist helping patients manage joint pain.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor2_mqjlbn.png",
  //       "category": "Rheumatologist",
  //       "workingDays": ["Sunday", "Tuesday"],
  //       "startHour": "11:00",
  //       "endHour": "15:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Fady Mounir",
  //       "age": 39,
  //       "gender": "Male",
  //       "experience": 14,
  //       "bio": "Infectious disease specialist focusing on prevention.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor1_hcgs72.png",
  //       "category": "Infectious Disease",
  //       "workingDays": ["Wednesday", "Saturday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Nourhan Said",
  //       "age": 32,
  //       "gender": "Female",
  //       "experience": 7,
  //       "bio": "Speech therapist helping patients improve communication.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor4_doga28.png",
  //       "category": "Speech Therapy",
  //       "workingDays": ["Sunday", "Tuesday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Sherif ElMenshawy",
  //       "age": 44,
  //       "gender": "Male",
  //       "experience": 19,
  //       "bio": "ENT specialist treating ear, nose, and throat conditions.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor3_sp07xi.png",
  //       "category": "ENT",
  //       "workingDays": ["Monday", "Thursday"],
  //       "startHour": "09:30",
  //       "endHour": "13:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Yasmin ElMorsy",
  //       "age": 36,
  //       "gender": "Female",
  //       "experience": 11,
  //       "bio": "Nutritionist supporting healthy eating habits and wellness.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor1_m9pcl6.png",
  //       "category": "Nutritionist",
  //       "workingDays": ["Wednesday", "Saturday"],
  //       "startHour": "11:00",
  //       "endHour": "15:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Mohamed Sabry",
  //       "age": 41,
  //       "gender": "Male",
  //       "experience": 16,
  //       "bio": "Radiologist with expertise in diagnostic imaging.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor5_fw1tet.png",
  //       "category": "Radiologist",
  //       "workingDays": ["Tuesday", "Friday"],
  //       "startHour": "08:00",
  //       "endHour": "12:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Rania Abou ElMagd",
  //       "age": 39,
  //       "gender": "Female",
  //       "experience": 14,
  //       "bio": "Psychologist focused on cognitive behavioral therapy.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor2_mqjlbn.png",
  //       "category": "Psychologist",
  //       "workingDays": ["Sunday", "Wednesday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Hatem Abdel Aziz",
  //       "age": 48,
  //       "gender": "Male",
  //       "experience": 23,
  //       "bio": "Orthopedic spine surgeon with a decade of spinal cases.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor1_hcgs72.png",
  //       "category": "Orthopedic Surgeon",
  //       "workingDays": ["Monday", "Thursday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Dina Osama",
  //       "age": 30,
  //       "gender": "Female",
  //       "experience": 5,
  //       "bio": "Pediatric neurologist treating childhood neurological issues.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor5_up8deq.png",
  //       "category": "Pediatric Neurologist",
  //       "workingDays": ["Tuesday", "Friday"],
  //       "startHour": "11:00",
  //       "endHour": "15:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Karim ElTayeb",
  //       "age": 43,
  //       "gender": "Male",
  //       "experience": 18,
  //       "bio": "Pathologist with experience in lab diagnostics.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor2_rbeoox.png",
  //       "category": "Pathologist",
  //       "workingDays": ["Wednesday", "Saturday"],
  //       "startHour": "08:30",
  //       "endHour": "12:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Heba Mahmoud",
  //       "age": 37,
  //       "gender": "Female",
  //       "experience": 12,
  //       "bio": "Dermatologist with a focus on acne and skin care.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor3_z9zzbu.png",
  //       "category": "Dermatologist",
  //       "workingDays": ["Sunday", "Thursday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Youssef Kamel",
  //       "age": 50,
  //       "gender": "Male",
  //       "experience": 25,
  //       "bio": "Anesthesiologist ensuring safe surgical procedures.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor4_fb8lrm.png",
  //       "category": "Anesthesiologist",
  //       "workingDays": ["Monday", "Friday"],
  //       "startHour": "07:30",
  //       "endHour": "11:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Mariam Sobhy",
  //       "age": 35,
  //       "gender": "Female",
  //       "experience": 10,
  //       "bio": "Occupational therapist aiding patients with daily activities.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor4_doga28.png",
  //       "category": "Occupational Therapist",
  //       "workingDays": ["Tuesday", "Saturday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Hany Fouad",
  //       "age": 46,
  //       "gender": "Male",
  //       "experience": 21,
  //       "bio": "Plastic surgeon performing aesthetic and reconstructive surgery.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor3_sp07xi.png",
  //       "category": "Plastic Surgeon",
  //       "workingDays": ["Wednesday", "Friday"],
  //       "startHour": "11:00",
  //       "endHour": "15:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Rasha Tamer",
  //       "age": 33,
  //       "gender": "Female",
  //       "experience": 8,
  //       "bio": "Audiologist providing hearing assessments and support.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor1_m9pcl6.png",
  //       "category": "Audiologist",
  //       "workingDays": ["Sunday", "Thursday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Adel Naguib",
  //       "age": 42,
  //       "gender": "Male",
  //       "experience": 17,
  //       "bio": "General surgeon with a broad range of surgical expertise.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor5_fw1tet.png",
  //       "category": "General Surgeon",
  //       "workingDays": ["Monday", "Saturday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Lamees ElDin",
  //       "age": 38,
  //       "gender": "Female",
  //       "experience": 13,
  //       "bio": "Internal medicine specialist treating chronic diseases.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor2_mqjlbn.png",
  //       "category": "Internal Medicine",
  //       "workingDays": ["Tuesday", "Friday"],
  //       "startHour": "10:30",
  //       "endHour": "14:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Seif Fathy",
  //       "age": 34,
  //       "gender": "Male",
  //       "experience": 9,
  //       "bio": "Chiropractor improving spinal health and alignment.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor1_hcgs72.png",
  //       "category": "Chiropractor",
  //       "workingDays": ["Wednesday", "Sunday"],
  //       "startHour": "09:30",
  //       "endHour": "13:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Amal Younes",
  //       "age": 40,
  //       "gender": "Female",
  //       "experience": 15,
  //       "bio": "Pulmonologist managing chronic respiratory diseases.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560961/femal_deoctor5_up8deq.png",
  //       "category": "Pulmonologist",
  //       "workingDays": ["Thursday", "Saturday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Ehab Nassar",
  //       "age": 45,
  //       "gender": "Male",
  //       "experience": 20,
  //       "bio": "Gastroenterologist helping patients with digestive issues.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560882/male_deoctor2_rbeoox.png",
  //       "category": "Gastroenterologist",
  //       "workingDays": ["Monday", "Friday"],
  //       "startHour": "08:30",
  //       "endHour": "12:30",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Menna Sherif",
  //       "age": 31,
  //       "gender": "Female",
  //       "experience": 6,
  //       "bio": "Geneticist working in hereditary disease diagnosis.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560962/femal_deoctor3_z9zzbu.png",
  //       "category": "Geneticist",
  //       "workingDays": ["Tuesday", "Sunday"],
  //       "startHour": "10:00",
  //       "endHour": "14:00",
  //       "slotDuration": 30
  //     },
  //     {
  //       "name": "Basel Omar",
  //       "age": 49,
  //       "gender": "Male",
  //       "experience": 24,
  //       "bio": "Endocrinologist focusing on thyroid and hormone disorders.",
  //       "image": "https://res.cloudinary.com/ddh61zg3j/image/upload/v1746560881/male_deoctor4_fb8lrm.png",
  //       "category": "Endocrinologist",
  //       "workingDays": ["Wednesday", "Saturday"],
  //       "startHour": "09:00",
  //       "endHour": "13:00",
  //       "slotDuration": 30
  //     },
  //   ];
  //
  //   try {
  //     for (var doctor in doctors) {
  //       await firestore.collection('doctors').add(doctor);
  //     }
  //     print('Doctors added successfully!');
  //   } catch (e) {
  //     print('Error adding doctors: $e');
  //   }
  // }

  Future<List<Map<String, dynamic>>> getDoctors() async {
    try {
      final QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('doctors').get();

      List<Map<String, dynamic>> doctorList = snapshot.docs
          .map((doc) =>
      {
        'name': doc['name'],
        'age': doc['age'],
        'gender': doc['gender'],
        'experience': doc['experience'],
        'bio': doc['bio'],
        'image': doc['image'],
        'category': doc['category'],
        'workingDays': List<String>.from(doc['workingDays']),
        'startHour': doc['startHour'],
        'endHour': doc['endHour'],
        'slotDuration': doc['slotDuration'],
      })
          .toList();

      return doctorList;
    } catch (e) {
      print('Error getting doctors: $e');
      return [];
    }
  }
  Future<List<Map<String, dynamic>>> getDoctorsAscending() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .orderBy('name', descending: false)
          .get();

      return snapshot.docs.map((doc) => {
        'name': doc['name'],
        'age': doc['age'],
        'gender': doc['gender'],
        'experience': doc['experience'],
        'bio': doc['bio'],
        'image': doc['image'],
        'category': doc['category'],
        'workingDays': List<String>.from(doc['workingDays']),
        'startHour': doc['startHour'],
        'endHour': doc['endHour'],
        'slotDuration': doc['slotDuration'],
      }).toList();
    } catch (e) {
      print('Error getting doctors (ascending): $e');
      return [];
    }
  }
  Future<List<Map<String, dynamic>>> getDoctorsDescending() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .orderBy('name', descending: true)
          .get();

      return snapshot.docs.map((doc) => {
        'name': doc['name'],
        'age': doc['age'],
        'gender': doc['gender'],
        'experience': doc['experience'],
        'bio': doc['bio'],
        'image': doc['image'],
        'category': doc['category'],
        'workingDays': List<String>.from(doc['workingDays']),
        'startHour': doc['startHour'],
        'endHour': doc['endHour'],
        'slotDuration': doc['slotDuration'],
      }).toList();
    } catch (e) {
      print('Error getting doctors: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getDoctorsExperience() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .orderBy('experience', descending: true)
          .get();

      return snapshot.docs.map((doc) => {
        'name': doc['name'],
        'age': doc['age'],
        'gender': doc['gender'],
        'experience': doc['experience'],
        'bio': doc['bio'],
        'image': doc['image'],
        'category': doc['category'],
        'workingDays': List<String>.from(doc['workingDays']),
        'startHour': doc['startHour'],
        'endHour': doc['endHour'],
        'slotDuration': doc['slotDuration'],
      }).toList();
    } catch (e) {
      print('Error sorting by experience: $e');
      return [];
    }
  }


  Future<List<Map<String, dynamic>>> getDoctorsAgeDescending() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .orderBy('age', descending: true)
          .get();

      return snapshot.docs.map((doc) => {
        'name': doc['name'],
        'age': doc['age'],
        'gender': doc['gender'],
        'experience': doc['experience'],
        'bio': doc['bio'],
        'image': doc['image'],
        'category': doc['category'],
        'workingDays': List<String>.from(doc['workingDays']),
        'startHour': doc['startHour'],
        'endHour': doc['endHour'],
        'slotDuration': doc['slotDuration'],
      }).toList();
    } catch (e) {
      print('Error sorting by age: $e');
      return [];
    }
  }
  Future<List<Map<String, dynamic>>> getDoctorsAgeAscending() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .orderBy('age', descending: false)
          .get();

      return snapshot.docs.map((doc) => {
        'name': doc['name'],
        'age': doc['age'],
        'gender': doc['gender'],
        'experience': doc['experience'],
        'bio': doc['bio'],
        'image': doc['image'],
        'category': doc['category'],
        'workingDays': List<String>.from(doc['workingDays']),
        'startHour': doc['startHour'],
        'endHour': doc['endHour'],
        'slotDuration': doc['slotDuration'],
      }).toList();
    } catch (e) {
      print('Error sorting by age: $e');
      return [];
    }
  }
  Future<List<Map<String, dynamic>>> getFemaleDoctors() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .where('gender', isEqualTo: 'Female')
          .get();

      return snapshot.docs.map((doc) => {
        'name': doc['name'],
        'age': doc['age'],
        'gender': doc['gender'],
        'experience': doc['experience'],
        'bio': doc['bio'],
        'image': doc['image'],
        'category': doc['category'],
        'workingDays': List<String>.from(doc['workingDays']),
        'startHour': doc['startHour'],
        'endHour': doc['endHour'],
        'slotDuration': doc['slotDuration'],
      }).toList();
    } catch (e) {
      print('Error fetching female doctors: $e');
      return [];
    }
  }
  Future<List<Map<String, dynamic>>> getMaleDoctors() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .where('gender', isEqualTo: 'Male')
          .get();

      return snapshot.docs.map((doc) => {
        'name': doc['name'],
        'age': doc['age'],
        'gender': doc['gender'],
        'experience': doc['experience'],
        'bio': doc['bio'],
        'image': doc['image'],
        'category': doc['category'],
        'workingDays': List<String>.from(doc['workingDays']),
        'startHour': doc['startHour'],
        'endHour': doc['endHour'],
        'slotDuration': doc['slotDuration'],
      }).toList();
    } catch (e) {
      print('Error fetching male doctors: $e');
      return [];
    }
  }
  Future<List<Map<String, dynamic>>> getDoctorByName({String? startsWith}) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .get();

      List<Map<String, dynamic>> doctorList = snapshot.docs.map((doc) => {
        'name': doc['name'],
        'age': doc['age'],
        'gender': doc['gender'],
        'experience': doc['experience'],
        'bio': doc['bio'],
        'image': doc['image'],
        'category': doc['category'],
        'workingDays': List<String>.from(doc['workingDays']),
        'startHour': doc['startHour'],
        'endHour': doc['endHour'],
        'slotDuration': doc['slotDuration'],
      }).toList();

      if (startsWith != null && startsWith.isNotEmpty) {
        final lowerPrefix = startsWith.toLowerCase();
        doctorList = doctorList
            .where((doctor) =>
            doctor['name'].toString().toLowerCase().startsWith(lowerPrefix))
            .toList();
      }

      return doctorList;
    } catch (e) {
      print('Error fetching doctors by name: $e');
      return [];
    }
  }
  Future<List<Map<String, dynamic>>> getDoctorsByCategory(String title) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .where('category', isEqualTo: title)
          .get();

      return snapshot.docs.map((doc) => {
        'name': doc['name'],
        'age': doc['age'],
        'gender': doc['gender'],
        'experience': doc['experience'],
        'bio': doc['bio'],
        'image': doc['image'],
        'category': doc['category'],
        'workingDays': List<String>.from(doc['workingDays']),
        'startHour': doc['startHour'],
        'endHour': doc['endHour'],
        'slotDuration': doc['slotDuration'],
      }).toList();
    } catch (e) {
      print('Error fetching male doctors: $e');
      return [];
    }
  }
  Future<List<Map<String, dynamic>>> getDoctorsByName(String name) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .where('name', isEqualTo: name)
          .get();

      return snapshot.docs.map((doc) => {
        'name': doc['name'],
        'age': doc['age'],
        'gender': doc['gender'],
        'experience': doc['experience'],
        'bio': doc['bio'],
        'image': doc['image'],
        'category': doc['category'],
        'workingDays': List<String>.from(doc['workingDays']),
        'startHour': doc['startHour'],
        'endHour': doc['endHour'],
        'slotDuration': doc['slotDuration'],
      }).toList();
    } catch (e) {
      print('Error fetching male doctors: $e');
      return [];
    }
  }
}