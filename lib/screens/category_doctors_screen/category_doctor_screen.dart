import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:quarizm/custom_widgets/doctor_boxes.dart';

class CategoryDoctorScreen extends StatelessWidget {
  final String categoryTitle;
  const CategoryDoctorScreen({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    BlocProvider.of<DoctorCubit>(context).getDoctorsByCategory(categoryTitle);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            context.read<DoctorCubit>().searchDoctors("");
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Doctors in $categoryTitle",style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            BlocBuilder<DoctorCubit, DoctorState>(
              builder: (context, state) {
                if (state is DoctorCategoryLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is DoctorCategorySuccess) {
                  final cubit = context.read<DoctorCubit>();
                  final doctorList = cubit.doctors;
                  int doctorsNumber=cubit.doctorsCategoryNumber;
                  return Column(
                    children: [
                      doctorsCards( doctorList, doctorsNumber, height, width),
                      SizedBox(height: height*.02,),
                    ],
                  );

                } else if (state is DoctorCategoryFailure) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return SizedBox(); // fallback
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  GridView doctorsCards( List<Map<String, dynamic>> doctorList, int doctorsNumber, double height, double width) {
    return GridView.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 15,
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 0.75,
      children: List.generate(
        doctorList.length,
            (index) => DoctorBoxes(
            drName: doctorList[index]['name'],
            drCategory: doctorList[index]['category'],
            drExperience: doctorList[index]['experience'],
            drImage: doctorList[index]['image'],
            height: height,
            width: width),
      ),
    );
  }

}
