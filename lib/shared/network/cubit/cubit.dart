import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/user_model.dart';
import '../../../modules/request_order/request_order_screen.dart';
import '../../../modules/requests/all_requests.dart';
import '../../../modules/settings/settings_screen.dart';
import '../../components/constants.dart';
import '../local/cash_helper.dart';
import 'states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  // Get context to Easily use in a different places in all Project
  static AppCubit get(context) => BlocProvider.of(context);

  // List of AppBar Title
  List<String> appBarTitle = const [
    'Home',
    'All Requests',
    'Settings',
  ];

  // Change BottomNavigationBar index
  int currentIndex = 0;
  List<Widget> screens = const [
    RequestOrderScreen(),
    AllRequestsScreen(),
    SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavigationBarState());
  }


  // Get User Data To stay Login
  UserModel? userModel;

  void getUserData() {
    //emit(AppGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(AppGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetUserErrorState(error.toString()));
    });
  }

  // Get Document IDs to start access to all data in document in firebase
  List<String> docIDs = [];

  Future getDocId() async
  {
    emit(AppGetDocIDsLoadingState());
    await FirebaseFirestore.instance.collection('requests').get().then((
        snapshot) {
      snapshot.docs.forEach((document) {
        docIDs.add(document.reference.id);
        emit(AppGetDocIDsSuccessState());
      });
    }).catchError((error)
    {
      emit(AppGetDocIDsErrorState(error));
    });
  }

  // Function to Change Theme mode
  bool isDark = false;

  void changeAppModeTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeThemeState());
    } else {
      isDark = !isDark;
      CashHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeThemeState());
      });
    }
  }


}
