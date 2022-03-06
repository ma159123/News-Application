import 'package:first_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/news_cubit.dart';
import 'cubit/news_states.dart';
class NewsSearch extends StatelessWidget {
  const NewsSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController=TextEditingController();
    var search=NewsCubit.get(context);
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (BuildContext context, state)=>Scaffold(
        appBar: AppBar(),
        body:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller:searchController ,
                keyboardType: TextInputType.text,
                onChanged: (value){
                  search.getSearch(value: value);
                },
                validator:(String? value){
                  if (value!.isEmpty) {
                    return 'search must be not empty';
                  } else {
                    return null;
                  }
                } ,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(child: buildArticleItem2(search.search,isSearch: true)),
          ],
        ) ,
      ),
      listener: (BuildContext context, Object? state) {},
    );
  }
}
