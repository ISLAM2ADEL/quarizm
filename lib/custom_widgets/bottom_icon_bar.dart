import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/cubit/bottom_cubit/bottom_cubit.dart';
import 'package:quarizm/screens/favorite_screen/favorite_screen.dart';
import 'package:quarizm/screens/home_screen/home_screen.dart';


class BottomIconBar extends StatelessWidget {
  const BottomIconBar({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: height * .1,
      surfaceTintColor: Colors.grey,
      color: Colors.white,
      child: BlocBuilder<BottomCubit, BottomState>(
        builder: (context, state) {
          final cubit = context.read<BottomCubit>();
          String bottomPage = cubit.bottomPage;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    cubit.changeBottomPage("home");
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Icon(Icons.home_filled, size: 35,color: cubit.bottomPage=="home"?Colors.black:Colors.grey,)),
              GestureDetector(
                  onTap: () {
                    cubit.changeBottomPage("favorite");
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FavoriteScreen()),
                    );
                  },
                  child: Icon(Icons.favorite, size: 35,color: cubit.bottomPage=="favorite"?Colors.black:Colors.grey,)),
              GestureDetector(
                  onTap: () {
                    cubit.changeBottomPage("date");
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Icon(Icons.date_range, size: 35,color: cubit.bottomPage=="date"?Colors.black:Colors.grey,)),
              GestureDetector(
                  onTap: () {
                    cubit.changeBottomPage("profile");
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Icon(CupertinoIcons.person_circle_fill, size: 35,color: cubit.bottomPage=="profile"?Colors.black:Colors.grey,)),
            ],
          );
        },
      ),
    );
  }
}
