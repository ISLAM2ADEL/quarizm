part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}
final class FavoriteLoading extends FavoriteState {}
final class FavoriteSuccess extends FavoriteState {}
final class FavoriteFailure extends FavoriteState {
  final String errorMessage;
  FavoriteFailure({required this.errorMessage});
}
final class FavoriteDoctorLoading extends FavoriteState {}
final class FavoriteDoctorSuccess extends FavoriteState {}
final class FavoriteDoctorFailure extends FavoriteState {
  final String errorMessage;
  FavoriteDoctorFailure({required this.errorMessage});
}
