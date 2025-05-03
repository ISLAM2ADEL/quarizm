part of 'login_register_cubit.dart';

@immutable
sealed class LoginRegisterState {}

final class LoginRegisterInitial extends LoginRegisterState {}

final class LoginRegisterObstructState extends LoginRegisterState {}
