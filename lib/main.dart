import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/cubit/login_register_cubit/login_register_cubit.dart';
import 'package:quarizm/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:quarizm/screens/onboarding_screen/onboarding_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(),
        ),
        BlocProvider(
          create: (context) => LoginRegisterCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quarizm Tech',
        home: OnboardingScreens(),
      ),
    );
  }
}