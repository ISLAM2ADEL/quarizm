part of 'appointment_cubit.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}
final class DayChangeSuccess extends AppointmentState {}
final class TimeChangeSuccess extends AppointmentState {}
final class AppointmentLoading extends AppointmentState {}
final class AppointmentSuccess extends AppointmentState {}
final class AppointmentFailure extends AppointmentState {
  final String errorMessage;
  AppointmentFailure({required this.errorMessage});
}
final class SlotsLoading extends AppointmentState {}
final class SlotsSuccess extends AppointmentState {}
final class SlotsFailure extends AppointmentState {
  final String errorMessage;
  SlotsFailure({required this.errorMessage});
}
