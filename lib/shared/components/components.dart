import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/News_app/cubit/news_cubit.dart';
import 'package:first_app/News_app/cubit/news_states.dart';
import 'package:first_app/News_app/webView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  required Function() function,
}) =>
    SizedBox(
      width: width,
      child: MaterialButton(
        onPressed: function,
      ),
    );

Widget articleBuilder(articles,index,context)=>InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen('${articles[index]['url']}')));
  },
  child:   Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(10.0),
            image:  DecorationImage(
              image: NetworkImage(
                '${articles[index]['urlToImage']}',
              ),
              fit: BoxFit.cover,
            ),
          )),
      const SizedBox(
        width: 10.0,
      ),
      Expanded(
        child: SizedBox(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Expanded(
                  child: Text(
                    '${articles[index]['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )),
              Text(
                '${articles[index]['publishedAt']}',
                style: const TextStyle(fontSize: 18.0,color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    ]),
  ),
);

Widget buildArticleItem2(list,{isSearch=false})=>BlocConsumer<NewsCubit, NewsStates>(
    listener: (context, state){},
    builder:(context,state)=>ConditionalBuilder(fallback: (BuildContext context)=>isSearch? Container():const Center(child: CircularProgressIndicator()),
      condition: list.isNotEmpty,
      builder: (BuildContext context)=>ListView.separated(itemCount:list.length,
        separatorBuilder: (BuildContext context, int index)=>const SizedBox(height: 10.0,),
        itemBuilder: (BuildContext context, int index)=>articleBuilder(list,index,context),
      ),


    )
);