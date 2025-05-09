import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quarizm/firebase/appointment_firebase/appointment_firebase.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(AppointmentInitial());
  DateTime? selectedDate;
  String time="";

  void changeDay(DateTime date) {
    selectedDate = date;
    emit(DayChangeSuccess());
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
  }

}
