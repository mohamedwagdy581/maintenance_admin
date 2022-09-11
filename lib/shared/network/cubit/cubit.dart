import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/user_model.dart';
import '../../components/constants.dart';
import '../local/cash_helper.dart';
import 'states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  // Get context to Easily use in a different places in all Project
  static AppCubit get(context) => BlocProvider.of(context);

  // Get User Data To stay Login
  UserModel? userModel;

  void getUserData() {
    //emit(AppGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(AppGetUserSuccessState());
    }).catchError((error) {
      emit(AppGetUserErrorState(error.toString()));
    });
  }

  // Get Document IDs to start access to all data in document in firebase
  List<String> allDocIDs = [];

  Future getAllDocId() async
  {
    emit(AppGetDocIDsLoadingState());
    await FirebaseFirestore.instance.collection('requests').get().then((
        snapshot) {
      snapshot.docs.forEach((document) {
        allDocIDs.add(document.reference.id);
        emit(AppGetDocIDsSuccessState());
      });
    }).catchError((error)
    {
      emit(AppGetDocIDsErrorState(error));
    });
  }

  // Get Document IDs to start access to all data in document in firebase
  List<String> doneDocIDs = [];

  Future getDoneDocId() async
  {
    emit(AppGetDoneDocIDsLoadingState());
    await FirebaseFirestore.instance.collection('doneRequests').get().then((
        snapshot) {
      snapshot.docs.forEach((document) {
        doneDocIDs.add(document.reference.id);
        emit(AppGetDoneDocIDsSuccessState());
      });
    }).catchError((error)
    {
      emit(AppGetDoneDocIDsErrorState(error));
    });
  }


  // Get Document IDs to start access to all data in document in firebase
  List<String> archivedDocIDs = [];

  Future getArchivedDocId() async
  {
    emit(AppGetArchivedDocIDsLoadingState());
    await FirebaseFirestore.instance.collection('archivedRequests').get().then((
        snapshot) {
      snapshot.docs.forEach((document) {
        archivedDocIDs.add(document.reference.id);
        emit(AppGetArchivedDocIDsSuccessState());
      });
    }).catchError((error)
    {
      emit(AppGetArchivedDocIDsErrorState(error));
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
