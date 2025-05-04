import 'package:flutter/material.dart';

const Color greyColor=Color(0xff9CA3AF);
const String path="assets/images/";

List<Map<String,String>>onboardingScreens=[
  {
    "image": "${path}Image 1.png",
    "title": "Meet Doctors Online",
    "description": "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.",
  },
  {
    "image": "${path}Image 2.png",
    "title": "Connect with Specialists",
    "description": "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.",
  },
  {
    "image": "${path}Image 3.png",
    "title": "Thousands of Online Specialists",
    "description": " Explore a Vast Array of Online Medical Specialists, Offering an Extensive Range of Expertise Tailored to Your Healthcare Needs..",
  },
];

List<Map<String,dynamic>>doctorContainer=[
  {
    "image": "${path}doctor 1.png",
    "title": "Looking For Specialist Doctors?",
    "description": "Schedule an appointment with our top doctors.",
    "colors": Colors.green.shade300,
  },
  {
    "image": "${path}doctor 2.png",
    "title": "Need a Health Checkup?",
    "description": "Book a full body checkup with our trusted specialists.",
    "colors": Colors.blue.shade300,
  },
  {
    "image": "${path}doctor 3.png",
    "title": "Talk to a Doctor Online!",
    "description": "Connect instantly with certified doctors anytime, anywhere.",
    "colors": Colors.orange.shade300,
  },
  {
    "image": "${path}doctor 4.png",
    "title": "Get Expert Medical Advice",
    "description": "Your health matters — consult our professionals today.",
    "colors": Colors.red.shade300,
  },
];