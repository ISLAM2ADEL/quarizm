import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quarizm/firebase/doctor_firebase/doctor_firebase.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  bool showAllDoctors=false;
  int doctorsNumber=10;
  List<Map<String, dynamic>> doctors = [];

  String searchQuery = '';
  bool isSearching = false;

  Future<void> getDoctors() async {
    emit(DoctorLoading());

    try {
      if (isSearching && searchQuery.isNotEmpty) {
        doctors = await DoctorFirebase().getDoctorByName(startsWith: searchQuery);
        doctorsNumber=doctors.length;
      } else {
        doctors = await DoctorFirebase().getDoctors();
        doctorsNumber=10;
      }
      emit(DoctorSuccess());
    } catch (e) {
      emit(DoctorFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }

  void searchDoctors(String query) {
    searchQuery = query;
    print(searchQuery);
    isSearching = query.isNotEmpty;
    print(isSearching);
    getDoctors();
  }
  void increaseNumber(){
    doctorsNumber+=10;
    emit(DoctorSuccess());
  }
  void showAll(){
    showAllDoctors=true;
    emit(DoctorSuccess());
  }
  void showLess(){
    showAllDoctors=false;
    doctorsNumber=10;
    emit(DoctorSuccess());
  }

  Future<void> getDoctorsAscending() async {
    emit(DoctorLoading());

    try {
      doctors = await DoctorFirebase().getDoctorsAscending();
      emit(DoctorSuccess());
    } catch (e) {
      emit(DoctorFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }

  Future<void> getDoctorsDescending() async {
    emit(DoctorLoading());

    try {
      doctors = await DoctorFirebase().getDoctorsDescending();
      emit(DoctorSuccess());
    } catch (e) {
      emit(DoctorFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }
  Future<void> getDoctorsExperience() async {
    emit(DoctorLoading());

    try {
      doctors = await DoctorFirebase().getDoctorsExperience();
      emit(DoctorSuccess());
    } catch (e) {
      emit(DoctorFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }
  Future<void> getDoctorsAgeAscendig() async {
    emit(DoctorLoading());

    try {
      doctors = await DoctorFirebase().getDoctorsAgeAscending();
      emit(DoctorSuccess());
    } catch (e) {
      emit(DoctorFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }
  Future<void> getDoctorsAgeDescending() async {
    emit(DoctorLoading());

    try {
      doctors = await DoctorFirebase().getDoctorsAgeDescending();
      emit(DoctorSuccess());
    } catch (e) {
      emit(DoctorFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }
  Future<void> getMaleDoctors() async {
    emit(DoctorLoading());

    try {
      doctors = await DoctorFirebase().getMaleDoctors();
      emit(DoctorSuccess());
    } catch (e) {
      emit(DoctorFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }
  Future<void> getFemaleDoctors() async {
    emit(DoctorLoading());
    try {
      doctors = await DoctorFirebase().getFemaleDoctors();
      emit(DoctorSuccess());
    } catch (e) {
      emit(DoctorFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }
}
