import 'package:first_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'cubit/news_cubit.dart';

class NewsScience extends StatelessWidget {
  const NewsScience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> science = NewsCubit.get(context).science;
    return buildArticleItem2(science);
  }
}
