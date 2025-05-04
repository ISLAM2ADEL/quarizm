import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/const.dart';
import 'package:quarizm/cubit/login_register_cubit/login_register_cubit.dart';
import 'package:quarizm/custom_widgets/custom_text_form.dart';
import 'package:quarizm/screens/forget_screen/forget_screen.dart';
import 'package:quarizm/screens/home_screen/home_screen.dart';
import 'package:quarizm/screens/register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _formLoginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cubit = context.read<LoginRegisterCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginRegisterCubit, LoginRegisterState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is LoginSuccess) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
  child: Padding(
        padding: EdgeInsets.only(
          top: height * .05,
          left: width*.05,
          right: width*.05,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: height * .08,
              child: Image.asset("${path}logo.png", scale: 2.5),
            ),
            SizedBox(height: height * .02),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    headerText(text: "Quarizm", textColor: Colors.grey),
                    headerText(text: "Tech", textColor: Colors.black),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * .02),
            Text(
              "Hi, Welcome Back! ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * .02),
            Text(
              "Hope you’re doing fine.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * .03),
            Form(
              key: _formLoginKey,
              child: Column(
                children: [
                  CustomTextForm(
                    width: width,
                    hintText: "Your Email",
                    prefixIcon: Icons.email_outlined,
                    controller: cubit.getEmailSignController(),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Your Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * .03),
                  CustomTextForm(
                    width: width,
                    hintText: "Password",
                    isPassword: true,
                    prefixIcon: Icons.lock_outline,
                    controller: cubit.getPasswordSignController(),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Your Password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * .035),
                  BlocBuilder<LoginRegisterCubit, LoginRegisterState>(
  builder: (context, state) {
    if (state is LoginLoading) {
     return CircularProgressIndicator();
    }
    return GestureDetector(
                    child: Container(
                      height: height * .065,
                      width: width * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (_formLoginKey.currentState!.validate()) {
                        cubit.signInUser(cubit.getEmailSignController().text, cubit.getPasswordSignController().text);
                      }
                    },
                  );
  },
),
                ],
              ),
            ),
            SizedBox(height: height * .04),
            orDivider(width),
            SizedBox(height: height * .04),
            loginContainer(height, width, text: "Sign In with Google", image: "google.png"),
            SizedBox(height: height * .03),
            loginContainer(height, width, text: "Sign In with Facebook", image: "Facebook.png"),
            SizedBox(height: height * .02),
            GestureDetector(
              child: Text(
                "Forget Password?",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ForgetScreen()));
              },
            ),
            SizedBox(height: height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account? ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => RegisterScreen()));
                  },
                ),
              ],
            ),
            SizedBox(height: height * .02),
          ],
        ),
      ),
),
    );
  }

  Row orDivider(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 1,
          width: width * .4,
          color: Colors.grey.shade500,
        ),
        Text(
          "OR",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: 1,
          width: width * .4,
          color: Colors.grey.shade500,
        ),
      ],
    );
  }

  TextSpan headerText({
    required String text,
    required Color textColor,
  }) {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Container loginContainer(double height, double width, {
    required String text,
    required String image,
  }) {
    return Container(
      height: height * .06,
      width: width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("$path$image", width: 20),
          Text(
            " $text",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
