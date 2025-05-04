import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quarizm/const.dart';
import 'package:quarizm/custom_widgets/search_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    Timer.periodic(Duration(seconds: 3), (Timer timer) {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*.07,vertical: height*.05),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello, User",style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),),
                GestureDetector(
                    child: Icon(Icons.notifications_none_outlined)),
              ],
            ),
            SizedBox(height: height*.03,),
            SearchForm(),
            SizedBox(height: height*.02,),
            doctorContainers(height, width),
            SizedBox(height: height*.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories",style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Text("See All",style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
            SizedBox(height: height*.02,),
            GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Prevent nested scroll issues
              childAspectRatio: 0.75, // Controls height vs width
              children: List.generate(8, (index) => categoryBoxes(height, width)),
            ),
            SizedBox(height: height*.02,),
          ],
        ),
      ),
    );
  }

  Column categoryBoxes(double height, double width) {
    return Column(
                  children: [
                    Container(
                      height: height*.08,
                      width: width*.18,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    SizedBox(height: height*.01,),
                    Text("text",style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      ),
                    ),
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

