part of 'bottom_cubit.dart';

@immutable
sealed class BottomState {}

final class BottomInitial extends BottomState {}
final class BottomChanged extends BottomState {}
