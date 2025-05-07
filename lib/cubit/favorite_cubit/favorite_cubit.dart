import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quarizm/firebase/favorite_firebase/favorite_firebase.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  List<Map<String, dynamic>> favorites = [];

  Future<void> addFavorite(String name) async {
    emit(FavoriteLoading());
    try {
      await FavoriteFirebase().addFavorite(name);
      emit(FavoriteSuccess());
    } catch (e) {
      emit(FavoriteFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }

  Future<void> getDoctors() async {
    emit(FavoriteDoctorLoading());
    try {
      favorites = await FavoriteFirebase().getDoctors();
      print(favorites.length);
      emit(FavoriteDoctorSuccess());
    } catch (e) {
      emit(FavoriteDoctorFailure(errorMessage: e.toString().replaceAll("Exception: ", "")));
    }
  }
}
