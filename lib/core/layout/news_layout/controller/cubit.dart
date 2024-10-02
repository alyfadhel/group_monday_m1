import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/layout/news_layout/controller/state.dart';
import 'package:group_monday_m1/core/shared/network/remote/dio_helper.dart';
import 'package:group_monday_m1/features/modules/news/business/presentation/screen/business_screen.dart';
import 'package:group_monday_m1/features/modules/news/science/presentation/screen/science_screen.dart';
import 'package:group_monday_m1/features/modules/news/sports/presentation/screen/sports_screen.dart';




class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  var searchController = TextEditingController();

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_baseball_outlined,
        ),
        label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.science_outlined,
        ),
        label: 'Science'),
  ];

  List<String> titles = [
    'Business',
    'Sports',
    'Science',
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen()
  ];

  void changeBottomNav(index) {
    currentIndex = index;
    emit(NewsChangeBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void getBusinessData() {
    emit(NewsGetBusinessLoadingState());

    NewsDioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': 'cfaef72ddf46493fbea1e07aa50cd58b',
      },
    ).then(
      (value) {
        business = value.data['articles'];
        print(business.toString());
        emit(NewsGetBusinessSuccessState());
      },
    ).catchError(
      (error) {
        emit(NewsGetBusinessErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  void getSportsData() {
    emit(NewsGetSportsLoadingState());

    NewsDioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': 'cfaef72ddf46493fbea1e07aa50cd58b',
      },
    ).then(
      (value) {
        sports = value.data['articles'];
        print(sports.toString());
        emit(NewsGetSportsSuccessState());
      },
    ).catchError(
      (error) {
        emit(NewsGetSportsErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  void getScienceData() {
    emit(NewsGetScienceLoadingState());

    NewsDioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science',
        'apiKey': 'cfaef72ddf46493fbea1e07aa50cd58b',
      },
    ).then(
      (value) {
        science = value.data['articles'];
        print(sports.toString());
        emit(NewsGetScienceSuccessState());
      },
    ).catchError(
      (error) {
        emit(NewsGetScienceErrorState(error.toString()));
        print(error.toString());
      },
    );
  }

  void getSearchData({required String value}) {
    emit(NewsGetSearchLoadingState());

    NewsDioHelper.getData(
      url: '/v2/everything',
      query: {
        'apiKey': 'cfaef72ddf46493fbea1e07aa50cd58b',
        'q': value,
      },
    )
        .then(
          (value) {
            search = value.data['articles'];
            emit(NewsGetSearchSuccessState());
          },
        )
        .catchError(
          (error) {
            emit(NewsGetSearchErrorState(error.toString()));
            print(error.toString());
          },
        );
  }
}
