
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';

import '../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;

        return (list.isNotEmpty)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: buildImageSlider(context, list),
                  ),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildArticleItem(context, list[index]),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: list.length,
                    ),
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator(color: Colors.amber,));
      },
    );
  }
}
