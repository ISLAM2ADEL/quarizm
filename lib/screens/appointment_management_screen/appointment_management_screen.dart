import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quarizm/cubit/bottom_cubit/bottom_cubit.dart';
import 'package:quarizm/cubit/manager_cubit/manger_cubit.dart';
import 'package:quarizm/screens/appointment_management_screen/schedule_screen.dart';
import 'package:quarizm/screens/home_screen/home_screen.dart';

class AppointmentManagementScreen extends StatelessWidget {
  const AppointmentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    BlocProvider.of<ManagerCubit>(context).getDates();

    return BlocConsumer<ManagerCubit, ManagerState>(
      listener: (context, state) {
        if (state is DateCancelFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMessage),
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
            title: const Text(
              "Patients Appointments",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                BlocProvider.of<BottomCubit>(context).bottomPage = "home";
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
          body: BlocBuilder<ManagerCubit, ManagerState>(
            builder: (context, state) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Builder(
                      builder: (context) {
                        if (state is DatePatientsLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is DatePatientsSuccess) {
                          final cubit = context.read<ManagerCubit>();
                          final dateList = cubit.dates;

                          List<Map<String, dynamic>> pastAppointments = [];
                          List<Map<String, dynamic>> upcomingAppointments = [];

                          final now = DateTime.now();
                          final dateFormat = DateFormat("d MMM yyyy HH:mm");

                          for (var appt in dateList) {
                            try {
                              String cleanedDay = appt["day"].split(',')[1].trim();
                              String fullDateTime = "$cleanedDay ${appt["time"]}";
                              DateTime appointmentDate = dateFormat.parse(fullDateTime);

                              if (appointmentDate.isBefore(now)) {
                                pastAppointments.add(appt);
                              } else {
                                upcomingAppointments.add(appt);
                              }
                            } catch (e) {
                              // Ignore format errors
                            }
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Past Appointments",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final appt = pastAppointments[index];
                                  return dateContainer(
                                    context,
                                    height,
                                    width,
                                    doctorNum: dateList.indexOf(appt),
                                    drName: appt['doctor'],
                                    dateDay: appt['day'],
                                    dateTime: appt['time'],
                                    showActions: false,
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(height: height * .02),
                                itemCount: pastAppointments.length,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Upcoming Appointments",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final appt = upcomingAppointments[index];
                                  return dateContainer(
                                    context,
                                    height,
                                    width,
                                    doctorNum: dateList.indexOf(appt),
                                    drName: appt['doctor'],
                                    dateDay: appt['day'],
                                    dateTime: appt['time'],
                                    showActions: true,
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(height: height * .03),
                                itemCount: upcomingAppointments.length,
                              ),
                            ],
                          );
                        } else if (state is DatePatientsFailure) {
                          return Center(child: Text(state.errorMessage));
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget dateContainer(
      BuildContext context,
      double height,
      double width, {
        required String drName,
        required String dateDay,
        required String dateTime,
        required int doctorNum,
        required bool showActions,
      }) {
    return Container(
      height: height * .2,
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
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DR: $drName",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Day: $dateDay",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Date: $dateTime",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          if (showActions)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                cardContainer(
                  context,
                  height,
                  width,
                  text: "Schedule",
                  color: Colors.orangeAccent.shade400,
                  index: doctorNum,
                ),
                cardContainer(
                  context,
                  height,
                  width,
                  text: "Cancel",
                  color: Colors.redAccent.shade400,
                  index: doctorNum,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget cardContainer(
      BuildContext context,
      double height,
      double width, {
        required String text,
        required Color color,
        required int index,
      }) {
    return GestureDetector(
      onTap: () {
        final cubit = context.read<ManagerCubit>();
        text == "Cancel"
            ? cubit.cancelAppointment(cubit.dates[index]['day'], cubit.dates[index]['time'])
            : Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ScheduleScreen(drName: cubit.dates[index]['doctor'],drDay: cubit.dates[index]['day'], drTime: cubit.dates[index]['time'],),
          ),
        );
      },
      child: Container(
        height: height * .05,
        width: width * .4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
