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
      emit(DateCancelLoading());
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