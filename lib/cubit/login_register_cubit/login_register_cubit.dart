import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_register_state.dart';

class LoginRegisterCubit extends Cubit<LoginRegisterState> {
  LoginRegisterCubit() : super(LoginRegisterInitial());


  final emailSignController = TextEditingController();
  final passwordSignController = TextEditingController();
  final nameRegisterController = TextEditingController();
  final emailRegisterController = TextEditingController();
  final passwordRegisterController = TextEditingController();




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
}
