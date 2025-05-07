import 'package:flutter/material.dart';
import 'package:quarizm/const.dart';
import 'package:quarizm/screens/doctor_screen/doctor_screen.dart';

class DoctorBoxes extends StatelessWidget {
  const DoctorBoxes({
    super.key,
    required this.height,
    required this.width,
    required this.drName,
    required this.drCategory,
    required this.drExperience,
    required this.drImage,
  });

  final double height;
  final double width;
  final String drName;
  final String drCategory;
  final int drExperience;
  final String drImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height * .23,
        width: width*.4,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(

                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>
                    [
                    Color(0xff2a1a4a),
                    Color(0xff4a1a4d),
                    Color(0xff6a1a4f),
                    Color(0xff8a2a4f),
                    Color(0xffa5454f),
                    Color(0xffbc6050),
                    Color(0xffd37f55),
                    Color(0xffe89f65),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: FadeInImage.assetNetwork(
                  placeholder: '${path}loading.png',
                  image: drImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(
              width: width*.37,
              child: Text("DR. $drName",style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            Text(drCategory,style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            ),
            Text("Experience :${drExperience.toString()}",style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),),

          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => DoctorScreen(drName: drName)),
              (route) => false,
        );
      },
    );
  }
}
