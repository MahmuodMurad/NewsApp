import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'layout/cubit/cubit.dart';
import 'layout/cubit/states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[700]!,
                hoverColor: Colors.grey[400]!,
                gap: 8,
                activeColor: Colors.amber,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Theme.of(context).primaryColor,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                ],
                selectedIndex: cubit.currentIndex,
                onTabChange: (index) {
                  cubit.changeBottomNavBar(index);
                },
              ),
            ),
          );
        });
  }
}
