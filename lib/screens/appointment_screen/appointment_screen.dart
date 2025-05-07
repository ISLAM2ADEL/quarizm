import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quarizm/cubit/appointment_cubit/appointment_cubit.dart';
import 'package:quarizm/custom_widgets/custom_working_day.dart';
import 'package:quarizm/custom_widgets/time_slots.dart';

class AppointmentScreen extends StatelessWidget {
  final String? doctorName;
  final String? startHour;
  final String? endHour;
  final int? timeSlots;
  final List<String>? workingDays;

  const AppointmentScreen({
    super.key,
    required this.doctorName,
    required this.startHour,
    required this.endHour,
    required this.timeSlots,
    required this.workingDays,
  });


  String getWeekdayName(int weekday) {
    const names = {
      1: 'Monday',
      2: 'Tuesday',
      3: 'Wednesday',
      4: 'Thursday',
      5: 'Friday',
      6: 'Saturday',
      7: 'Sunday',
    };
    return names[weekday]!;
  }

  // كل أيام الأسبوع بالتواريخ
  Map<String, DateTime> getWeekDaysWithDates() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1)); // Monday
    final Map<String, DateTime> weekDays = {};
    for (int i = 0; i < 7; i++) {
      final day = startOfWeek.add(Duration(days: i));
      final weekdayName = getWeekdayName(day.weekday);
      weekDays[weekdayName] = day;
    }
    return weekDays;
  }

  List<MapEntry<String, DateTime>> getDoctorWorkingDaysWithDates() {
    final weekDaysWithDates = getWeekDaysWithDates();
    if (workingDays == null) return [];

    return weekDaysWithDates.entries
        .where((entry) => workingDays!.contains(entry.key))
        .toList();
  }

  List<String> generateTimeSlots(String start, String end, int slotInterval) {
    final format = DateFormat("HH:mm");
    DateTime startTime = format.parse(start);
    DateTime endTime = format.parse(end);
    List<String> slots = [];

    while (startTime.isBefore(endTime)) {
      slots.add(format.format(startTime));
      startTime = startTime.add(Duration(minutes: slotInterval));
    }

    return slots;
  }


  @override
  Widget build(BuildContext context) {
    final timeSlotsList = generateTimeSlots(startHour!, endHour!, timeSlots!);
    String selectedSlot = "";
    final workingDays = getDoctorWorkingDaysWithDates();
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return BlocConsumer<AppointmentCubit, AppointmentState>(
  listener: (context, state) {
    if (state is AppointmentFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.errorMessage),
            duration: const Duration(seconds: 3),
          )
      );
    }
    if (state is AppointmentSuccess) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Appointment booked successfully"),
            duration: Duration(seconds: 3),
          )
      );
    }
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Appointment"),
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose Day:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: height*.23,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  workingDays.length,
                      (index) {
                    final entry = workingDays[index];
                    return CustomWorkingDay(
                      dayName: entry.key,
                      date: entry.value,
                    );
                  },
                ),
              )

            ),
            Text("Choose Time:",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            const SizedBox(height: 10,),
            TimeSlots(
              slots: timeSlotsList,
              selectedSlot: selectedSlot,
              onSlotSelected: (slot) {
                selectedSlot = slot;
              },
            ),
            SizedBox(height: height*.035,),
            GestureDetector(
              child: Container(
                height: height * .08,
                width: width * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
              ),
                child: Center(
                  child: Text("Book Appointment", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  ),
              ),
              ),
              onTap: (){
                String day = context.read<AppointmentCubit>().day;
                String time = context.read<AppointmentCubit>().time;
                context.read<AppointmentCubit>().bookAppointment(doctorName!,day, time);
              },
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
