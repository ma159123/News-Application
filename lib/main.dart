import 'package:first_app/News_app/cubit/news_cubit.dart';
import 'package:first_app/News_app/cubit/news_states.dart';
import 'package:first_app/shared/network/remote/local/cach_helper.dart';
import 'package:first_app/shared/network/remote/news_dio.dart';
import 'package:first_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'News_app/news_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CacheHelper.init();

 bool isDark=CacheHelper.getBoolean(key:'isDark')??false;
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {
   final bool isDark;
const MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..changeAppMode(fromShared: isDark)..getSports()..getScience()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme:light,
            darkTheme: dark,
            themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
           debugShowCheckedModeBanner: false,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
