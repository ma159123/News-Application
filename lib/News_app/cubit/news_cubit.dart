import 'package:first_app/shared/network/remote/local/cach_helper.dart';
import 'package:first_app/shared/network/remote/news_dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bussiness.dart';
import '../science.dart';
import '../sports.dart';
import 'news_states.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);


  int index=0;
  List<Widget>screens=[
    const NewsSports(),
  const NewsScience(),
  const NewsBusiness(),
  ];

  List<String>titles=[
    'Sport News',
    'Science News',
    'Business News',
    'Settings',
  ];

  List<dynamic>business=[];
  List<dynamic>sports=[];
  List<dynamic>science=[];
  List<BottomNavigationBarItem>items=[
    const BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: 'Science'),
    const BottomNavigationBarItem(icon: Icon(Icons.business_sharp),label: 'Business'),
  ];
 void changeBottomNavBar( int index){
    this.index=index;
    emit(ChangeBottomNavBarState());
  }
  void changeScreens( int index){
    this.index=index;
    emit(ChangeScreensState());
  }
  void changeTitles( int index){
    this.index=index;
    emit(ChangeTitleState());
  }
  void getSports()async{
    emit(GetSportsDataLoadingState());
    await DioHelper.getData(query: {
      'country':'eg',
      'category':'sports',
      'apiKey':'c4ae36be81a94ce69f114806c4c397fd'
    }, url: 'v2/top-headlines').then((value) {
      sports=value.data['articles'];
      emit(GetSportsDataSuccessState());
    }).catchError((error){
      emit(GetSportsDataErrorState(error));
      print(error.toString());
    });
  }

  void getBusiness(){
   emit(GetBusinessDataLoadingState());
   DioHelper.getData(query: {
     'country':'eg',
     'category':'business',
     'apiKey':'c4ae36be81a94ce69f114806c4c397fd'
   }, url: 'v2/top-headlines').then((value) {
     business=value.data['articles'];
     emit(GetBusinessDataSuccessState());
   }).catchError((error){
     emit(GetBusinessDataErrorState(error));
     print(error.toString());
   });
  }

  void getScience(){
    emit(GetScienceDataLoadingState());
    DioHelper.getData(query: {
      'country':'eg',
      'category':'science',
      'apiKey':'c4ae36be81a94ce69f114806c4c397fd'
    }, url: 'v2/top-headlines').then((value) {
      science=value.data['articles'];
      emit(GetScienceDataSuccessState());
    }).catchError((error){
      emit(GetScienceDataErrorState(error));
      print(error.toString());
    });
  }

List<dynamic>search=[];
  void getSearch({required String value}){
    emit(GetSearchDataLoadingState());
    DioHelper.getData(query: {
      'q':value,
      'apiKey':'c4ae36be81a94ce69f114806c4c397fd'
    }, url: 'v2/everything').then((value) {
      search=value.data['articles'];
      emit(GetSearchDataSuccessState());
    }).catchError((error){
      emit(GetSearchDataErrorState(error));
      print(error.toString());
    });
   }

  bool isDark=false;
  void changeAppMode({ bool? fromShared})
  {
    if(fromShared!=null)
    {
      isDark=fromShared;
      emit(AppChangeModeState());
    } else
    {
      isDark=!isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }

  }

}