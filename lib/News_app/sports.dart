import 'package:first_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'cubit/news_cubit.dart';

class NewsSports extends StatelessWidget {
  const NewsSports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> sports = NewsCubit.get(context).sports;
    return buildArticleItem2(sports);
  }
}
