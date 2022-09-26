import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

import '../layout/cubit/cubit.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).search;
        return SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                style: TextStyle(color: Theme.of(context).primaryColor),
                controller: searchController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  NewsCubit.get(context).getSearch(value);
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'search must not be empty';
                  }
                  return null;
                },
                cursorColor: Colors.amber,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(34.0),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.amber,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(34.0),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.amber,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(34.0),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.amber,
                    ),
                  ),
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),

            (list.isNotEmpty)
                ? Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildArticleItem(context, list[index]),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: list.length,
              ),
            )
                :Container(),
          ],
        ),
      );},

    );
  }
}
