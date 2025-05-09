import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/const.dart';
import 'package:quarizm/cubit/category_cubit/category_cubit.dart';
import 'package:quarizm/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:quarizm/custom_widgets/bottom_icon_bar.dart';
import 'package:quarizm/custom_widgets/category_boxes.dart';
import 'package:quarizm/custom_widgets/doctor_boxes.dart';
import 'package:quarizm/custom_widgets/search_form.dart';
import 'package:quarizm/firebase/auth_firebase/auth_firebase.dart';
import 'package:quarizm/screens/category_screen/category_screen.dart';
import 'package:quarizm/screens/login_screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController=TextEditingController();
  late PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    BlocProvider.of<CategoryCubit>(context).getCategories();
    BlocProvider.of<DoctorCubit>(context).getDoctors();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(Duration(seconds: 3), (Timer timer) {
        if (!_pageController.hasClients) return;

        if (_currentPage < doctorContainer.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return BlocListener<CategoryCubit, CategoryState>(
  listener: (context, state) {
    if (state is CategoryFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  },
  child: Scaffold(
    bottomNavigationBar: BottomIconBar(height: height),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            left:  width*.07,
            right: width*.07,
            top: height*.03),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Welcome Back!",style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),),
                GestureDetector(
                  onTap: (){
                    AuthFirebase().signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                          (route) => false,
                    );
                  },
                    child: Icon(Icons.logout,size: 30,color: Colors.red,))
              ],
            ),
            SizedBox(height: height*.03,),
            SearchForm(hintText: "Search Doctor...",controller: textController,),
            SizedBox(height: height*.02,),
            doctorContainers(height, width),
            SizedBox(height: height*.02,),
            categoriesRow(context,title: "Categories"),
            SizedBox(height: height*.02,),
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CategorySuccess) {
                  final categoryList = context.read<CategoryCubit>().categories;
                  return categoryCards(height, width, categoryList);
                } else if (state is CategoryFailure) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return SizedBox(); // fallback
                }
              },
            ),
            SizedBox(height: height*.02,),
            doctorsRow(context,title: "Doctors"),
            SizedBox(height: height*.02,),
            BlocBuilder<DoctorCubit, DoctorState>(
              builder: (context, state) {
                if (state is DoctorLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is DoctorSuccess) {
                  final cubit = context.read<DoctorCubit>();
                  final doctorList = cubit.doctors;
                  bool showAll=cubit.showAllDoctors;
                  int doctorsNumber=cubit.doctorsNumber;
                  return Column(
                    children: [
                      doctorsCards(showAll, doctorList, doctorsNumber, height, width),
                      SizedBox(height: height*.02,),
                      showAll?showLessContainer(height, width, context):showMoreOrAll(height, width),
                    ],
                  );

                } else if (state is DoctorFailure) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return SizedBox(); // fallback
                }
              },
            ),
            SizedBox(height: height*.03,),
          ],
        ),
      ),
    ),
);
  }

  GridView categoryCards(double height, double width, List<Map<String, dynamic>> categoryList) {
    return GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.75,
                  children: List.generate(
                    context.read<CategoryCubit>().categoriesNumber==20?8:context.read<CategoryCubit>().categoriesNumber,
                        (index) => CategoryBoxes(height: height,
                            width: width,
                            color1: categoryColors[index]['color1']!,
                            color2: categoryColors[index]['color2']!,
                            color3: categoryColors[index]['color3']!,
                            color4: categoryColors[index]['color4']!,
                            title: categoryList[index]['name'],
                            image: categoryList[index]['image']),
                  ),
                );
  }

  Widget showMoreOrAll(double height, double width) {
    return context.read<DoctorCubit>().isSearching?SizedBox():Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showContainer(height, width,text: "Show More"),
                        showContainer(height, width,text: "Show All"),
                      ],
                    );
  }

  Widget showLessContainer(double height, double width, BuildContext context) {
    return context.read<DoctorCubit>().isSearching?SizedBox():GestureDetector(
                      child: Container(
                        height: height*.08,
                        width: width*.9,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("Show Less",style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      ),
                      onTap: (){
                        context.read<DoctorCubit>().showLess();
                      },
                    );
  }

  GridView doctorsCards(bool showAll, List<Map<String, dynamic>> doctorList, int doctorsNumber, double height, double width) {
    return GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 0.75,
                      children: List.generate(
                        showAll?doctorList.length:doctorsNumber,
                            (index) => DoctorBoxes(
                                drName: doctorList[index]['name'],
                                drCategory: doctorList[index]['category'],
                                drExperience: doctorList[index]['experience'],
                                drImage: doctorList[index]['image'],
                                height: height,
                                width: width),
                      ),
                    );
  }

  Widget showContainer(double height, double width,{
    required String text,
  }) {
    return GestureDetector(
      child: Container(
                  height: height*.08,
                  width: width*.4,
                  decoration: BoxDecoration(
                    color: text=="Show All"?Colors.greenAccent:Colors.yellowAccent.shade700,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(text,style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
      onTap: (){
        text=="Show All"?
        context.read<DoctorCubit>().showAll()
            :context.read<DoctorCubit>().increaseNumber();
      },
    );
  }

  Row categoriesRow(BuildContext context,{
    required String title,
  }) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
              GestureDetector(
                child: Text("See All",style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                ),
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CategoryScreen()),
                  );
                },

              ),
            ],
          );
  }
  Row doctorsRow(BuildContext context,{
    required String title,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        ),
        GestureDetector(
          child: Container(
            height: 30,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Sort",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.filter_alt_rounded, size: 22),
              ],
            ),
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(Icons.sort_by_alpha),
                      title: Text("From A to Z"),
                      onTap: () {
                        context.read<DoctorCubit>().getDoctorsAscending();
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.sort_by_alpha_outlined),
                      title: Text("From Z to A"),
                      onTap: () {
                        context.read<DoctorCubit>().getDoctorsDescending();
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.trending_up),
                      title: Text("Highest Experience"),
                      onTap: () {
                        context.read<DoctorCubit>().getDoctorsExperience();
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.trending_up),
                      title: Text("Age Ascending"),
                      onTap: () {
                        context.read<DoctorCubit>().getDoctorsAgeAscendig();
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.trending_down),
                      title: Text("Age Descending"),
                      onTap: () {
                        context.read<DoctorCubit>().getDoctorsAgeDescending();
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.male),
                      title: Text("Male"),
                      onTap: () {
                        context.read<DoctorCubit>().getMaleDoctors();
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.female),
                      title: Text("Female"),
                      onTap: () {
                        context.read<DoctorCubit>().getFemaleDoctors();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        )

      ],
    );
  }



  SizedBox doctorContainers(double height, double width) {
    return SizedBox(
            height: height * .23,
            child: PageView.builder(
              controller: _pageController,
              itemCount: doctorContainer.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: doctorContainer[index]['colors']!,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * .44,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctorContainer[index]['title']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                doctorContainer[index]['description']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .23,
                        width: width * .35,
                        child: Image.asset(
                          doctorContainer[index]['image']!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                );
              },
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
            ),
          );
  }
}




