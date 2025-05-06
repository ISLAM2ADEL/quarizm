import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quarizm/firebase/doctor_firebase/doctor_firebase.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  List<Map<String, dynamic>> doctors = [];
  Future<void> getDoctors() async {
    emit(DoctorLoading());

    try {
      doctors = await DoctorFirebase().getDoctors();
      emit(DoctorSuccess());
    } catch (e) {
      emit(DoctorFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }
}
