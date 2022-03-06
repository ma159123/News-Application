import 'package:first_app/News_app/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/news_cubit.dart';
import 'cubit/news_states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          title: Text(
              NewsCubit.get(context).titles[NewsCubit.get(context).index]),
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const NewsSearch()));
            }, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  NewsCubit.get(context).changeAppMode();
                  //print(NewsCubit.get(context).isDark);
                },
                icon: const Icon(Icons.brightness_4_outlined)),
          ],
        ),
        body: NewsCubit.get(context).screens[NewsCubit.get(context).index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: NewsCubit.get(context).index,
          onTap: (index) {
            NewsCubit.get(context).changeBottomNavBar(index);
            NewsCubit.get(context).changeTitles(index);
          },
          items: NewsCubit.get(context).items,
        ),
      ),
    );
  }
}
