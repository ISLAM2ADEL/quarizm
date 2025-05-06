import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/cubit/bottom_cubit/bottom_cubit.dart';
import 'package:quarizm/cubit/category_cubit/category_cubit.dart';
import 'package:quarizm/cubit/login_register_cubit/login_register_cubit.dart';
import 'package:quarizm/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:quarizm/screens/home_screen/home_screen.dart';
import 'package:quarizm/screens/onboarding_screen/onboarding_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
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
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),
        BlocProvider(
          create: (context) => BottomCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quarizm Tech',
        home: FirebaseAuth.instance.currentUser != null?HomeScreen():OnboardingScreens(),
      ),
    );
  }
}