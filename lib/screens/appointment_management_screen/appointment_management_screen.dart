import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/cubit/bottom_cubit/bottom_cubit.dart';
import 'package:quarizm/cubit/manager_cubit/manger_cubit.dart';
import 'package:quarizm/screens/home_screen/home_screen.dart';

class AppointmentManagementScreen extends StatelessWidget {
  const AppointmentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    BlocProvider.of<ManagerCubit>(context).getDates();
    return BlocConsumer<ManagerCubit, ManagerState>(
      listener: (context, state) {
        if (state is DateCancelFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMessage), // use the state's errorMessage
            ),
          );
        }

        if (state is DateCancelSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text("Appointment canceled successfully"),
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Patients Appointments", style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            BlocProvider
                .of<BottomCubit>(context)
                .bottomPage = "home";
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
      ),
      body: BlocBuilder<ManagerCubit, ManagerState>(
  builder: (context, state) {
    return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<ManagerCubit, ManagerState>(
              builder: (context, state) {
                if (state is DatePatientsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is DatePatientsSuccess) {
                  final cubit = context.read<ManagerCubit>();
                  final dateList = cubit.dates;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => dateContainer(
                        context,
                        height,
                        width,
                        doctorNum: index,
                        drName: dateList[index]['doctor'],
                        dateDay: dateList[index]['day'],
                        dateTime: dateList[index]['time']),
                    separatorBuilder: (context, index) => SizedBox(height: height * .03),
                    itemCount: dateList.length,
                  );
                } else if (state is DatePatientsFailure) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return SizedBox(); // fallback
                }
              },
            ),
          ),

        ],
      );
  },
),
    );
  },
);
  }

  Widget dateContainer(BuildContext context,double height, double width,{
    required String drName,
    required String dateDay,
    required String dateTime,
    required int doctorNum,
  }) {
    return Container(
                      height: height*.17,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text("DR: $drName",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Day: $dateDay",style:TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                                Text("Date: $dateTime",style:TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              cardContainer(context,height, width,text:"Schedule",color: Colors.orangeAccent.shade400,index: doctorNum),
                              cardContainer(context,height, width,text:"Cancel",color: Colors.redAccent.shade400,index: doctorNum),
                            ],
                          ),
                        ],
                      ),
                    );
  }

  Widget cardContainer(BuildContext context,double height, double width,{
    required String text,
    required Color color,
    required int index,
  }) {
    return GestureDetector(
      child: Container(
          height: height*.05,
          width: width*.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
        child: Center(
          child: Text(text,style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
        ),
                                ),
      onTap: () {
        final cubit=context.read<ManagerCubit>();
        text=="Cancel"?cubit.cancelAppointment(cubit.dates[index]['day'], cubit.dates[index]['time']):print("Schedule date : ${cubit.dates[index]['day']}");
      }
    );
  }
}