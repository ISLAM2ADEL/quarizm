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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height*.075,horizontal: width*.05),
        child: Form(
          child: ListView(
            children: [
              SizedBox(
                  height: height*.08,
                  child: Image.asset("${path}logo.png",scale: 2.5,)),
              SizedBox(height: height*.02,),
              Center(
                child: RichText(text: TextSpan(
                    children: [
                      headerText(text: "Quarizm",textColor: Colors.grey,),
                      headerText(text: "Tech",textColor: Colors.black,),
                    ]
                )),
              ),
              SizedBox(height: height*.02,),
              Text("Create Account ",style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.center,),
              SizedBox(height: height*.02,),
              Text("We are here to help you!",style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
                textAlign: TextAlign.center,),
              SizedBox(height: height*.03,),
              CustomTextForm(width: width,hintText: "Your Name",prefixIcon: Icons.person_outline,),
              SizedBox(height: height*.03,),
              CustomTextForm(width: width,hintText: "Your Email",prefixIcon:Icons.email_outlined,),
              SizedBox(height: height*.03,),
              CustomTextForm(width: width,hintText: "Password",prefixIcon: Icons.lock_outline,),
              SizedBox(height: height*.035,),
              Container(
                height: height*.065,
                width: width*.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text("Sign In",style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              SizedBox(height: height*.04,),
              orDivider(width),
              SizedBox(height: height*.04,),
              loginContainer(height, width, text: "Sign In with Google", image: "google.png"),
              SizedBox(height: height*.03,),
              loginContainer(height, width, text: "Sign In with Facebook", image: "Facebook.png"),
              SizedBox(height: height*.02,),
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
  Row orDivider(double width) {
    return Row(
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
    );
  }
}
