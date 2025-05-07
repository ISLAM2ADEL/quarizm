import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quarizm/cubit/appointment_cubit/appointment_cubit.dart';

class CustomWorkingDay extends StatelessWidget {
  final String dayName;
  final DateTime date;

  const CustomWorkingDay({
    super.key,
    required this.dayName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: height * .02),
      child: Column(
        children: [
          BlocBuilder<AppointmentCubit, AppointmentState>(
  builder: (context, state) {
    final cubit = context.read<AppointmentCubit>();
    final doctor = cubit.day;
    return GestureDetector(
            child: Container(
              height: height * .075,
              margin: EdgeInsets.symmetric(horizontal: width * .0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue),
                color: doctor==dayName?Colors.greenAccent.shade100:Colors.transparent,
              ),
              child: Padding(
                padding:  EdgeInsets.only(left:width* .05),
                child: Row(
                  spacing: 15.0,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.blue),
                    Text(
                      dayName,style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),),
                    Text(DateFormat('dd MMMM yyyy').format(date),style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),),
                  ],
                ),
              ),
            ),
            onTap: () {
              cubit.changeDay(dayName);;
            },
          );
  },
),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
