import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/cubit/login_register_cubit/login_register_cubit.dart';

class CustomTextForm extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final double width;

  const CustomTextForm({
    super.key,
    required this.width,
    required this.hintText,
    required this.prefixIcon,
    this.controller,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool isChanged = true;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginRegisterCubit>();
    final isObstruct = cubit.getObstruct(widget.isPassword, isChanged);

    return SizedBox(
      width: widget.width * 0.9,
      child: TextFormField(
        obscureText: widget.isPassword && isObstruct,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: widget.isPassword
              ? GestureDetector(
            onTap: () {
              setState(() {
                isChanged = !isChanged;
              });
              cubit.toggleObstruct();
            },
            child: Icon(
              isObstruct
                  ? CupertinoIcons.eye_slash
                  : CupertinoIcons.eye,
            ),
          )
              : null,
          prefixIcon: Icon(widget.prefixIcon, size: 20, color: Colors.grey),
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.green),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
