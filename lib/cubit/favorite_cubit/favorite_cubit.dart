import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:quarizm/firebase/favorite_firebase/favorite_firebase.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  List<Map<String, dynamic>> favorites = [];

  Future<void> addFavorite(String name,BuildContext context) async {
    emit(FavoriteLoading());
    try {
      await FavoriteFirebase().addFavorite(name);
      emit(FavoriteSuccess());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Appointment canceled successfully"),
          duration: Duration(seconds: 3),
        ),
      );
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
