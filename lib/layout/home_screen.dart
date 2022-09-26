import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/modules/news/business_screen.dart';
import '/modules/news/entertainment_screen.dart';
import '/modules/news/health_screen.dart';
import '/modules/news/science_screen.dart';
import '/modules/news/sports_screen.dart';
import '/modules/news/technology_screen.dart';
import '/modules/news/general_news_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var md = MediaQuery.of(context).size;

    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getBusiness()
        ..getEntertainment()
        ..getGeneral()
        ..getHealth()
        ..getScience()
        ..getSports()
        ..getTechnology(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: DefaultTabController(
              length: 7,
              child: Scaffold(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(md.height * 0.16),
                  child: AppBar(
                    bottom: TabBar(
                      tabs: const [
                        Tab(
                          child: Text(
                            'All News',
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Business',
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Entertainment',
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Health',
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Science',
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Sports',
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Technology',
                          ),
                        ),
                      ],
                      isScrollable: true,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      indicatorWeight: 4,
                      unselectedLabelColor: Colors.grey[500],
                      labelColor: Theme.of(context).primaryColor,
                      labelStyle: const TextStyle(fontSize: 18),
                    ),
                    title: ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: const Image(
                        image: AssetImage('assets/images/images.png'),
                        fit: BoxFit.cover,
                        width: 150,
                        height: 50,
                      ),
                    ),
                  ),
                ),
                body: const TabBarView(
                  children: [
                    AllNewsScreen(),
                    BusinessScreen(),
                    EntertainmentScreen(),
                    HealthScreen(),
                    ScienceScreen(),
                    SportsScreen(),
                    TechnologyScreen(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
