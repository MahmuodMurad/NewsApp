import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import '/layout/cubit/states.dart';
import '/layout/home_screen.dart';

import '/modules/search_screen.dart';
import '/modules/settings_screen.dart';

import '../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  String? country = CacheHelper.getCountryData(key: 'country');

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens =  [
    const HomeScreen(),
    SearchScreen(),
    const SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }




  void changeCountry({String? countryShared,cent,required BuildContext context}) {
    if (countryShared != null) {
      country = countryShared;
      emit(AppChangeModeState());
    }else {
      country=cent;
      Flushbar(
        title:  "$country selected",
        titleColor: Theme.of(context).primaryColor,
        message:  "You are now Following the News of $country ",
        messageColor:Theme.of(context).primaryColor ,
        icon: const Icon(Icons.location_city_outlined),
        backgroundColor: Theme.of(context).backgroundColor,
        flushbarPosition: FlushbarPosition.TOP,
        duration:  const Duration(seconds: 3),
      ).show(context);
      print(country);
      CacheHelper.putCountryData(key: 'country', value: country).then((value) {
        emit(AppChangeCountryState());
      });
    }


  }


  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }




  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country,
        'category':'business' ,
        'apiKey': 'e29089c5e2984aa1bf918e6d07652d89',
      },
    ).then((value) {
      business = value.data['articles'];
      print(country);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error);
      print(country);
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> entertainment = [];

  void getEntertainment() {
    emit(NewsGetEntertainmentLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country,
        'category':'entertainment' ,
        'apiKey': 'e29089c5e2984aa1bf918e6d07652d89',
      },
    ).then((value) {
      entertainment = value.data['articles'];

      emit(NewsGetEntertainmentSuccessState());
    }).catchError((error) {
      emit(NewsGetEntertainmentErrorState(error.toString()));
    });
  }

  List<dynamic> general = [];

  void getGeneral() {
    emit(NewsGetGeneralLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country,
        'category':'' ,
        'apiKey': 'e29089c5e2984aa1bf918e6d07652d89',
      },
    ).then((value) {
      general = value.data['articles'];

      emit(NewsGetGeneralSuccessState());
    }).catchError((error) {
      emit(NewsGetGeneralErrorState(error.toString()));
    });
  }

  List<dynamic> health = [];

  void getHealth() {
    emit(NewsGetHealthLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country,
        'category':'health' ,
        'apiKey': 'e29089c5e2984aa1bf918e6d07652d89',
      },
    ).then((value) {
      health = value.data['articles'];

      emit(NewsGetHealthSuccessState());
    }).catchError((error) {
      emit(NewsGetHealthErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country,
        'category':'science' ,
        'apiKey': 'e29089c5e2984aa1bf918e6d07652d89',
      },
    ).then((value) {
      science = value.data['articles'];

      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country,
        'category':'sports' ,
        'apiKey': 'e29089c5e2984aa1bf918e6d07652d89',
      },
    ).then((value) {
      sports = value.data['articles'];

      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> technology = [];

  void getTechnology() {
    emit(NewsGetTechnologyLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country,
        'category':'technology' ,
        'apiKey': 'e29089c5e2984aa1bf918e6d07652d89',
      },
    ).then((value) {
      technology = value.data['articles'];

      emit(NewsGetTechnologySuccessState());
    }).catchError((error) {
      emit(NewsGetTechnologyErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':'e29089c5e2984aa1bf918e6d07652d89',
      },
    ).then((value)
    {
      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

}
