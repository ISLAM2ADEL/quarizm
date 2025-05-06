import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/cubit/category_cubit/category_cubit.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    BlocProvider.of<CategoryCubit>(context).getCategories();
    return BlocConsumer<CategoryCubit, CategoryState>(
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
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Categories",style: TextStyle(
          color: Colors.black,
      ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,),
      ),
      ),
      body: ListView(
        children: [
          SizedBox(height: height*.03,),
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CategorySuccess) {
                final categoryList = context.read<CategoryCubit>().categories;
                return GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.75,
                  children: List.generate(
                    categoryList.length,
                        (index) => categoryBoxes(
                      height,
                      width,
                      colors: Colors.green.shade300,
                      title: categoryList[index]['name'],
                      image: categoryList[index]['image'],
                    ),
                  ),
                );
              } else if (state is CategoryFailure) {
                return Center(child: Text(state.errorMessage));
              } else {
                return SizedBox(); // fallback
              }
            },
          ),
        ],
      ),
    );
  },
);
  }
  Column categoryBoxes(double height, double width, {
    required Color colors,
    required String title,
    required String image,
  }) {
    return Column(
      children: [
        Container(
          height: height * .085,
          width: width * .18,
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Image.asset(image,width: width*.13,)),
        ),
        SizedBox(height: height * .01),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,

            ),
          ),
        ),
      ],
    );
  }
}
