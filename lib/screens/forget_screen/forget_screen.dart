import 'package:flutter/material.dart';
import 'package:quarizm/const.dart';
import 'package:quarizm/custom_widgets/custom_text_form.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: height*.1,horizontal: width*.05),
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
            CustomTextForm(width: width,hintText: "Your Email",prefixIcon:Icons.email_outlined,),
            SizedBox(height: height*.035,),
            Container(
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
            ],
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
