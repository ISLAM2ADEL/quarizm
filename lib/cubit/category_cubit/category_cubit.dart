import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quarizm/firebase/category_firebase/category_firebase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  List<Map<String, dynamic>> categories = [];
  Future<void> getCategories() async {
    emit(CategoryLoading());

    try {
      categories = await CategoryFirebase().getCategories();
      emit(CategorySuccess());
    } catch (e) {
      emit(CategoryFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }
}
