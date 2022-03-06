import 'package:first_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cubit/news_cubit.dart';

class NewsBusiness extends StatelessWidget {
  const NewsBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> business = NewsCubit.get(context).business;
    return buildArticleItem2(business);
  }
}
