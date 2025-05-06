import 'package:flutter/material.dart';
import 'package:quarizm/const.dart';

class CategoryBoxes extends StatelessWidget {
  const CategoryBoxes({
    super.key,
    required this.height,
    required this.width,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
    required this.title,
    required this.image,
  });

  final double height;
  final double width;
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            height: height * .085,
            width: width * .18,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                color1,
                color2,
                color3,
                color4,
              ]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child:
            FadeInImage.assetNetwork(
              placeholder: '${path}loading.png', // صورة مؤقتة أو لودر
              image: image,width: width*.13,
            ),
            ),
          ),
          SizedBox(height: height * .01),
          SizedBox(
            width: width * .26,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      onTap: (){
        print(title);
      },
    );
  }
}
