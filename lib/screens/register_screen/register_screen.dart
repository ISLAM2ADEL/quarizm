import 'package:flutter/material.dart';
import 'package:quarizm/const.dart';
import 'package:quarizm/custom_widgets/custom_text_form.dart';
import 'package:quarizm/screens/login_screen/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height*.075),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("${path}logo.png",width: width*.18,),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Quarizm",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                      TextSpan(text: "Tech",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),),
                    ]
                )),
                Text("Create Account ",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                Text("We are here to help you!",style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),),
                CustomTextForm(width: width,hintText: "Your Name",prefixIcon: Icons.person_outline,),
                CustomTextForm(width: width,hintText: "Your Email",prefixIcon:Icons.email_outlined,),
                CustomTextForm(width: width,hintText: "Password",prefixIcon: Icons.lock_outline,),
                Container(
                  height: height*.065,
                  width: width*.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text("Create Account",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 1,
                      width: width*.4,
                      color: Colors.grey.shade500,
                    ),
                    Text("OR",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),),
                    Container(
                      height: 1,
                      width: width*.4,
                      color: Colors.grey.shade500,
                    ),
                  ],
                ),
                loginContainer(height, width, text: "Continue with Google", image: "google.png"),
                loginContainer(height, width, text: "Continue with Facebook", image: "Facebook.png"),
                Text("Forget Password?",style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do you have an account? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      child: Text("Sign In",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container loginContainer(double height, double width,{
    required String text,
    required String image,
  }) {
    return Container(
      height: height*.06,
      width: width*.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("$path$image",width: 20,),
          Text(" $text",style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
        ],
      ),
    );
  }
}
