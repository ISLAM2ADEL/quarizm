import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:quarizm/screens/login_screen/login_screen.dart';

import '../../const.dart';

class OnboardingScreens extends StatelessWidget {
  const OnboardingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(bottom: height*.03),
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
  builder: (context, state) {
    final cubit=context.read<OnboardingCubit>();
    String pageNum=cubit.getPageNum();
    return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: height*.6,
              width: width,
              child: Image.asset(onboardingScreens[int.parse(pageNum)-1]["image"]!, fit: BoxFit.cover),
            ),
            Text(onboardingScreens[int.parse(pageNum)-1]["title"]!,style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:width*.07),
              child: Text(onboardingScreens[int.parse(pageNum)-1]["description"]!,style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              child: Container(
                height: height*.068,
                width: width*.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                ),
                child:Center(
                  child: Text("Next",style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              onTap: (){
                pageNum == "3"
                    ? Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()))
                    : cubit.nextPage();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index){
                return (index+1).toString()==pageNum?Container(
                  height: 10,
                  width: 50,
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                ):
                Container(
                  height: 10,
                  width: 10,
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey,
                  ),
                );
              }),
            ),
            GestureDetector(
              child: Text("Skip",style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()));
              },
            ),
          ],
        );
  },
),
      ),
    );
  }
}
