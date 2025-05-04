import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/const.dart';
import 'package:quarizm/cubit/login_register_cubit/login_register_cubit.dart';
import 'package:quarizm/custom_widgets/custom_text_form.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final _formForgetKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    final cubit=context.read<LoginRegisterCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginRegisterCubit, LoginRegisterState>(
  listener: (context, state) {
    if(state is ForgetPasswordSuccess){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Check your email and change your password"),
          backgroundColor: Colors.green,
            ),
      );
      Navigator.of(context).pop();
    }
    else if(state is ForgetPasswordFailure){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
          backgroundColor: Colors.red,
            ),
      );
    }
  },
  child: Padding(
        padding:  EdgeInsets.only(
          top: height * .05,
          left: width*.05,
          right: width*.05,
        ),
        child: ListView(
          children: [
            Center(
              child: Image.asset("${path}logo.png",scale: 2.5,),
            ),
            SizedBox(height: height*.02,),
            Center(
              child: RichText(text: TextSpan(
                children: [
                  headerText(text: "Quarizm",textColor: Colors.grey,),
                  headerText(text: "Tech",textColor: Colors.black,),
                ],
              ),
              ),
            ),
            SizedBox(height: height*.035,),
            Text("Forget Password?",style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height*.02,),
            Text("Enter your Email, we will send you a verification code.",style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height*.03,),
            Form(
              key: _formForgetKey,
              child: Column(
                children: [
                  CustomTextForm(width: width,hintText: "Your Email",controller: cubit.getEmailForgetController(),prefixIcon:Icons.email_outlined,validator: (val){
                    if(val!.isEmpty){
                      return "Please Enter Your Email";
                    }
                    return null;
                  },),
                  SizedBox(height: height*.035,),
                  BlocBuilder<LoginRegisterCubit, LoginRegisterState>(
  builder: (context, state) {
    if(state is ForgetPasswordLoading){
      return CircularProgressIndicator();
    }
    return GestureDetector(
                    child: Container(
                      height: height*.065,
                      width: width*.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black,
                      ),
                      child:Center(
                        child: Text("Send Code",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                    onTap: (){
                      if(_formForgetKey.currentState!.validate()){
                        cubit.forgetPassword(cubit.getEmailForgetController().text);
                      }
                    },
                  );
  },
),
                ],
              ),
            ),
          ],
        ),
      ),
),
    );
  }
  TextSpan headerText({
    required String text,
    required Color textColor,
  }) {
    return TextSpan(text: text,style: TextStyle(
      color: textColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ));
  }
}


