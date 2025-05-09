import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:quarizm/firebase/appointment_firebase/appointment_firebase.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(AppointmentInitial());
  DateTime? selectedDate;
  String time="";
  List<String> bookedTimes = [];

  void changeDay(DateTime date) {
    selectedDate = date;
    time="";
    emit(DayChangeSuccess());
  }
  void setSlots(String name,String day) async{
    emit(SlotsLoading());
    try {
      bookedTimes = await AppointmentFirebase().setSlots(name,day);
      emit(SlotsSuccess());
    } catch (e) {
      emit(SlotsFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }

  }
  void changeTime(String timeChosen){
    time = timeChosen;
    emit(TimeChangeSuccess());
  }

  Future<void> bookAppointment(String name,String dayChosen,String timeChosen) async {
    emit(AppointmentLoading());
    try {
      await AppointmentFirebase().addAppointment(name,dayChosen,timeChosen);
      emit(AppointmentSuccess());
    } catch (e) {
      emit(AppointmentFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
    time="";
  }

  Future<void> scheduleAppointment(String name,String pastDay,String pastTime,String dayChosen,String timeChosen) async {
    emit(AppointmentLoading());
    try {
      await AppointmentFirebase().scheduleAppointment(name,pastDay,pastTime,dayChosen,timeChosen);
      emit(AppointmentSuccess());
    } catch (e) {
      emit(AppointmentFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
    time="";
  }
}
