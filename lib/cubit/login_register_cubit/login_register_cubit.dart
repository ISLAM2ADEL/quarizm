import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:quarizm/firebase/auth_firebase/auth_firebase.dart';

part 'login_register_state.dart';

class LoginRegisterCubit extends Cubit<LoginRegisterState> {
  LoginRegisterCubit() : super(LoginRegisterInitial());


  final emailSignController = TextEditingController();
  final passwordSignController = TextEditingController();
  final nameRegisterController = TextEditingController();
  final emailRegisterController = TextEditingController();
  final passwordRegisterController = TextEditingController();
  final emailForgetController = TextEditingController();



  TextEditingController getEmailSignController(){
    return emailSignController;
  }
  TextEditingController getPasswordSignController(){
    return passwordSignController;
  }
  TextEditingController getNameRegisterController(){
    return nameRegisterController;
  }
  TextEditingController getEmailRegisterController(){
    return emailRegisterController;
  }
  TextEditingController getPasswordRegisterController(){
    return passwordRegisterController;
  }
  TextEditingController getEmailForgetController(){
    return emailForgetController;
  }
  bool getObstruct(bool isPassword , bool isChanged){
    if(isPassword&&isChanged){
      return true;
    }else{
      return false;
    }

  }
  void toggleObstruct(){
    emit(LoginRegisterObstructState());
  }

  void registerUser(String name, String email, String password) async {
    emit(RegisterLoading());
    try {
      await AuthFirebase().registerUser(name, email, password);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }
  void signInUser(String email, String password) async {
    emit(LoginLoading());
    try {
      await AuthFirebase().signInUser(email, password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }

  void forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    try {
      await AuthFirebase().forgetPassword(email);
      emit(ForgetPasswordSuccess());
    } catch (e) {
      emit(ForgetPasswordFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }
  void signInWithGoogle() async {
    emit(GoogleLoading());
    try {
      await AuthFirebase().signInWithGoogle();
      emit(GoogleSuccess());
    } catch (e) {
      emit(GoogleFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }
}
