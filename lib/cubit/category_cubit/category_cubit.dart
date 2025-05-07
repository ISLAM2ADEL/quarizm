import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quarizm/firebase/category_firebase/category_firebase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  List<Map<String, dynamic>> categories = [];
  int categoriesNumber = 8;
  String searchQuery = '';
  bool isSearching = false;
  Future<void> getCategories() async {
    emit(CategoryLoading());

    try {
      if (isSearching && searchQuery.isNotEmpty) {
        categories = await CategoryFirebase().getCategoryByName(startsWith: searchQuery);
      }
      else {
        categories = await CategoryFirebase().getCategories();
      }
      categoriesNumber=categories.length;
      emit(CategorySuccess());
    } catch (e) {
      emit(CategoryFailure(
          errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }
  void searchCategories(String query) {
    searchQuery = query;
    print(searchQuery);
    isSearching = query.isNotEmpty;
    print(isSearching);
    getCategories();
  }
}