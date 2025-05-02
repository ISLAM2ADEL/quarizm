import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextForm({
    super.key,
    required this.width,
    required this.hintText,
    required this.prefixIcon,
    this.controller,
    this.validator,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width*.9,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Icon(prefixIcon,size: 20,color: Colors.grey),
            filled: true,
            fillColor: Colors.grey.shade200,
            contentPadding: EdgeInsets.symmetric(vertical: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.green), // or your app's primary color
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red), // or your app's error color
            )
        ),
      ),
    );
  }
}
