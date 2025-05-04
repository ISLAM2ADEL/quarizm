part of 'login_register_cubit.dart';

@immutable
sealed class LoginRegisterState {}

final class LoginRegisterInitial extends LoginRegisterState {}

final class LoginRegisterObstructState extends LoginRegisterState {}

final class RegisterLoading extends LoginRegisterState {}
final class RegisterSuccess extends LoginRegisterState {}
final class RegisterFailure extends LoginRegisterState {
  final String errorMessage;
  RegisterFailure({required this.errorMessage});
}

final class LoginSuccess extends LoginRegisterState {}
final class LoginLoading extends LoginRegisterState {}
final class LoginFailure extends LoginRegisterState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}
final class ForgetPasswordSuccess extends LoginRegisterState {}
final class ForgetPasswordLoading extends LoginRegisterState {}
final class ForgetPasswordFailure extends LoginRegisterState {
  final String errorMessage;
  ForgetPasswordFailure({required this.errorMessage});
}
