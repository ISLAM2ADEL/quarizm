part of 'doctor_cubit.dart';

@immutable
sealed class DoctorState {}

final class DoctorInitial extends DoctorState {}
final class DoctorLoading extends DoctorState {}
final class DoctorSuccess extends DoctorState {}
final class DoctorFailure extends DoctorState {
  final String errorMessage;
  DoctorFailure({required this.errorMessage});
}
final class DoctorCategoryLoading extends DoctorState {}
final class DoctorCategorySuccess extends DoctorState {}
final class DoctorCategoryFailure extends DoctorState {
  final String errorMessage;
  DoctorCategoryFailure({required this.errorMessage});
}
final class DoctorByNameLoading extends DoctorState {}
final class DoctorByNameSuccess extends DoctorState {}
final class DoctorByNameFailure extends DoctorState {
  final String errorMessage;
  DoctorByNameFailure({required this.errorMessage});
}

