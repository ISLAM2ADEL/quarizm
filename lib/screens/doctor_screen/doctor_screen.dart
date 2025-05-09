import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/const.dart';
import 'package:quarizm/cubit/category_cubit/category_cubit.dart';
import 'package:quarizm/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:quarizm/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:quarizm/screens/appointment_screen/appointment_screen.dart';
import 'package:quarizm/screens/home_screen/home_screen.dart';

class DoctorScreen extends StatelessWidget {
  final String drName;
  const DoctorScreen({super.key, required this.drName});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    BlocProvider.of<DoctorCubit>(context).getDoctorsByName(drName);
    return BlocConsumer<FavoriteCubit, FavoriteState>(
  listener: (context, state) {
    if (state is FavoriteFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
    else if (state is FavoriteSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Added to Favourites"),
            backgroundColor: Colors.green,
          )
      );
    }
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Doctor"),
        centerTitle:true ,
        leading: GestureDetector(
            onTap: (){
              context.read<DoctorCubit>().searchDoctors("");
              context.read<CategoryCubit>().searchCategories("");
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width*.07,right: width*.07,top: height*.03),
        child: ListView(
          children: [
            BlocBuilder<DoctorCubit, DoctorState>(
  builder: (context, state) {
    final cubit = context.read<DoctorCubit>();
    final doctor = cubit.doctorDetails;
    if (state is DoctorByNameLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is DoctorByNameSuccess) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>
                  [
                    Color(0xff2a1a4a),
                    Color(0xff4a1a4d),
                    Color(0xff6a1a4f),
                    Color(0xff8a2a4f),
                    Color(0xffa5454f),
                    Color(0xffbc6050),
                    Color(0xffd37f55),
                    Color(0xffe89f65),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: FadeInImage.assetNetwork(
                  placeholder: '${path}loading.png',
                  image: doctor[0]['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: height * .02,),
            Text(doctor[0]['name'], style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            SizedBox(height: height * .02,),
            Text(doctor[0]['category'], style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),),
            SizedBox(height: height * .02,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildContainer(height, width, icon: Icons.star,
                    text: "${doctor[0]['experience'].toString()} Years",
                    subText: "Experience",
                    color: Colors.orangeAccent,),
                  buildContainer(height, width, icon: Icons.person,
                    text: "${doctor[0]['age'].toString()} Years",
                    subText: "Age",
                    color: Colors.pink,),
                  buildContainer(height, width, icon: Icons.merge_type,
                    text: doctor[0]['gender'],
                    subText: "Gender",
                    color: Colors.blueAccent,),
                ]
            ),
            SizedBox(height: height * .02,),
            doctorTexts(height, text: "Doctor's Bio:",
                subText: doctor[0]['bio']),
            SizedBox(height: height * .02,),
            doctorTexts(height, text: "Working Days:",
                subText: doctor[0]['workingDays'].toString().replaceAll('[', '').replaceAll(']', '')),
            SizedBox(height: height * .02,),
            doctorTexts(
                height, text: "Working Hours:",
                subText: "${doctor[0]['startHour']} - ${doctor[0]['endHour']}"),
            SizedBox(height: height * .03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customContainers(context,
                    height,
                    width,
                    text: "Book Appointment",
                    color: Colors.blueAccent,
                    doctorName: doctor[0]['name'],
                    startHour: doctor[0]['startHour'],
                    endHour: doctor[0]['endHour'],
                    timeSlots: doctor[0]['slotDuration'],
                    workingDays: doctor[0]['workingDays']
                ),
                customContainers(context,height, width,text: "Add to Favourites", color: Colors.redAccent.shade400),
              ],
            ),
            SizedBox(height: height * .03,)
          ]
      );
    }
    else {
      return SizedBox();
    }
  },
)
            ]
        ),
      ),
    );
  },
);
  }

  Widget customContainers(BuildContext context,double height, double width,{
    required String text,
    required Color color,
    String? doctorName,
    String? startHour,
    String? endHour,
    int? timeSlots,
    List<String>? workingDays,
  }) {
    return GestureDetector(
      child: Container(
        height: height * .08,
        width: width * .4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Center(
          child: Text(text, style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
        ),
),
      onTap: (){
        text=="Add to Favourites"?context.read<FavoriteCubit>().addFavorite(drName):
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AppointmentScreen(
            doctorName: doctorName,
            startHour: startHour,
            endHour: endHour,
            timeSlots: timeSlots,
            workingDays: workingDays,
          )),
        );
      },
    );
  }

  Column doctorTexts(double height,{
    required String text,
    required String subText,
  }) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(text,style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height*.01,),
                  Text(subText,style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                  ),
                ],
              );
  }

  Container buildContainer(double height, double width,{
    required IconData icon,
    required String text,
    required String subText,
    required Color color,
  }) {
    return Container(
                    height: height*.2,
                    width: width*.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(icon,size: 40,color: color),
                        SizedBox(
                          width: width*.2,
                          child: Text(text,style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(subText,style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),),
                      ]
                    ),
                  );
  }
}
