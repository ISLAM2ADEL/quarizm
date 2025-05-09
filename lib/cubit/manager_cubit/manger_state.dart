part of 'manger_cubit.dart';

@immutable
sealed class ManagerState {}

final class ManagerInitial extends ManagerState {}
final class DatePatientsLoading extends ManagerState {}
final class DatePatientsSuccess extends ManagerState {}
final class DatePatientsFailure extends ManagerState {
  final String errorMessage;
  DatePatientsFailure({required this.errorMessage});
}
final class DateCancelLoading extends ManagerState {}
final class DateCancelSuccess extends ManagerState {}
final class DateCancelFailure extends ManagerState {
  final String errorMessage;
  DateCancelFailure({required this.errorMessage});
}
