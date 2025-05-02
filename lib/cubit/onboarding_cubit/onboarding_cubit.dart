import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  int pageNum=1;

  void nextPage(){
    pageNum++;
    emit(OnboardingNextPageState());
  }
  String getPageNum(){
    return pageNum.toString();
  }
}
