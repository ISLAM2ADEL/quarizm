import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:quarizm/firebase/date_firebase/date_firebase.dart';

part 'manger_state.dart';

class ManagerCubit extends Cubit<ManagerState> {
  ManagerCubit() : super(ManagerInitial());
  List<Map<String, dynamic>> dates = [];

  Future<void> getDates() async {
    emit(DatePatientsLoading());
    try {
      dates = await DateFirebase().getDates();
      print(dates.length);
      emit(DatePatientsSuccess());
    } catch (e) {
      emit(DatePatientsFailure(
          errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }

  Future<void> cancelAppointment(String day, String time) async {
    emit(DateCancelLoading());

    try {
      String cleanedDay = day.split(',')[1].trim(); // "11 May 2025"

      String fullDateTimeString = "$cleanedDay $time"; // "11 May 2025 14:30"

      DateFormat format = DateFormat("d MMM yyyy HH:mm");

      DateTime appointmentDateTime = format.parse(fullDateTimeString);

      final now = DateTime.now();
      final difference = appointmentDateTime.difference(now);
      if (appointmentDateTime.isBefore(now)) {
        emit(DateCancelFailure(errorMessage: "You can't cancel a past appointment."));
        getDates();
        return;
      }

      if (difference.inMinutes < 60) {
        emit(DateCancelFailure(errorMessage: "You can only cancel at least 1 hour before the appointment."));
        return;
      }
      await DateFirebase().cancelAppointment(day, time);
      emit(DateCancelSuccess());
      getDates();

    } catch (e) {
      emit(DateCancelFailure(
        errorMessage: e.toString().replaceAll("Exception: ", ""),
      ));
    }
  }
}