import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/cubit/category_cubit/category_cubit.dart';
import 'package:quarizm/cubit/doctor_cubit/doctor_cubit.dart';

class SearchForm extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  const SearchForm({
    required this.hintText,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
        onFieldSubmitted: (value) {
          hintText=="Search Category..."?context.read<CategoryCubit>().searchCategories(controller!.text):context.read<DoctorCubit>().searchDoctors(controller!.text);
        },
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green),
        ),
        hintText: hintText,
        suffixIcon: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
              hintText=="Search Category..."?context.read<CategoryCubit>().searchCategories(controller!.text):context.read<DoctorCubit>().searchDoctors(controller!.text);
          },
            child: Icon(Icons.send)
        ),
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
    );
  }
}
