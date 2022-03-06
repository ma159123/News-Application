import 'package:dio/dio.dart';

abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class ChangeBottomNavBarState extends NewsStates{}
class ChangeScreensState extends NewsStates{}
class ChangeTitleState extends NewsStates{}
class GetBusinessDataSuccessState extends NewsStates{}
class GetBusinessDataErrorState extends NewsStates{
  final DioError error;
  GetBusinessDataErrorState(this.error) ;
}
class GetBusinessDataLoadingState extends NewsStates{}
class GetSportsDataSuccessState extends NewsStates{}
class GetSportsDataErrorState extends NewsStates{
  final DioError error;
  GetSportsDataErrorState(this.error);
}
class GetSportsDataLoadingState extends NewsStates{}
class GetScienceDataSuccessState extends NewsStates{}
class GetScienceDataErrorState extends NewsStates{
  final DioError error;

  GetScienceDataErrorState(this.error);
}
class GetScienceDataLoadingState extends NewsStates{}
class ChangeAppThemeState extends NewsStates{}

class GetSearchDataLoadingState extends NewsStates{}
class GetSearchDataSuccessState extends NewsStates{}
class GetSearchDataErrorState extends NewsStates{
  final DioError error;

  GetSearchDataErrorState(this.error);
}
class AppChangeModeState extends NewsStates{}




