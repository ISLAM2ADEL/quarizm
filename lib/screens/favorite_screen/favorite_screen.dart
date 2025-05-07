import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/cubit/bottom_cubit/bottom_cubit.dart';
import 'package:quarizm/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:quarizm/custom_widgets/doctor_boxes.dart';
import 'package:quarizm/screens/home_screen/home_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    BlocProvider.of<FavoriteCubit>(context).getDoctors();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Favorites",style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            BlocProvider.of<BottomCubit>(context).bottomPage="home";
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                if (state is FavoriteDoctorLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is FavoriteDoctorSuccess) {
                  final cubit = context.read<FavoriteCubit>();
                  final doctorList = cubit.favorites;
                  int doctorsNumber=doctorList.length;
                  return Column(
                    children: [
                      doctorsCards( doctorList, doctorsNumber, height, width),
                      SizedBox(height: height*.02,),
                    ],
                  );
                } else if (state is FavoriteDoctorFailure) {
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
