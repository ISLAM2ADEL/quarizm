import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarizm/const.dart';
import 'package:quarizm/cubit/category_cubit/category_cubit.dart';
import 'package:quarizm/custom_widgets/category_boxes.dart';
import 'package:quarizm/custom_widgets/search_form.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final textController=TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryCubit>(context).getCategories();
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
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
            context.read<CategoryCubit>().searchCategories("");
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,),
      ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*.05),
        child: ListView(
          children: [
            SizedBox(height: height*.03,),
            SearchForm(hintText: "Search Category...",controller: textController,),
            SizedBox(height: height*.04,),
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CategorySuccess) {
                  final categoryList = context.read<CategoryCubit>().categories;
                  return GridView.count(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.75,
                    children: List.generate(
                      categoryList.length,
                          (index) => CategoryBoxes(
                        height: height,
                        width: width,
                            color1: categoryColors[index]['color1']!,
                            color2: categoryColors[index]['color2']!,
                            color3: categoryColors[index]['color3']!,
                            color4: categoryColors[index]['color4']!,
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
      ),
    );
  },
);
  }
}
