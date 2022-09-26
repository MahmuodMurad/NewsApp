import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/main_screen.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import '/shared/bloc_observer.dart';
import 'layout/cubit/cubit.dart';
import 'layout/cubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isDark}) : super(key: key);
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          NewsCubit()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
              primaryColor: Colors.white,
              primaryColorDark: Colors.grey[900],
              primaryColorLight: Colors.grey[200],
              colorScheme: ThemeData()
                  .colorScheme
                  .copyWith(secondary: const Color(0xff17191D)),
              primarySwatch: Colors.amber,
              scaffoldBackgroundColor: const Color(0xff17191D),
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xff17191D),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Color(0xff17191D),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            theme: ThemeData(
              primaryColor: Colors.black,
              primaryColorDark: Colors.grey[200],
              primaryColorLight: Colors.grey[500],
              colorScheme:
                  ThemeData().colorScheme.copyWith(secondary: Colors.white),
              primarySwatch: Colors.amber,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const MainScreen(),
          );
        },
      ),
    );
  }
}
