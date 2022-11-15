import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/user_model.dart';
import '../../components/constants.dart';
import '../local/cash_helper.dart';
import 'states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  // Get context to Easily use in a different places in all Project
  static AppCubit get(context) => BlocProvider.of(context);

  // Get Document IDs to start access to all data in document in firebase
  List<String> allUsers = [];

  Future getAllUsers({required String city}) async
  {
    emit(AppGetUsersLoadingState());
    allUsers.clear();
    await FirebaseFirestore.instance.collection(city).doc(city).collection('users').get().then((
        snapshot) {
      for (var document in snapshot.docs) {
        allUsers.add(document.reference.id);
        emit(AppGetUsersSuccessState());
      }
    }).catchError((error)
    {
      emit(AppGetUsersErrorState(error));
    });
  }

  // Get Document IDs to start access to all data in document in firebase
  List<String> allTechnicals = [];

  Future getAllTechnicals({required String city}) async
  {
    emit(AppGetTechnicalsLoadingState());
    allTechnicals.clear();
    await FirebaseFirestore.instance.collection(city).doc(city).collection('technicals').get().then((
        snapshot) {
      for (var document in snapshot.docs) {
        allTechnicals.add(document.reference.id);
        emit(AppGetTechnicalsSuccessState());
      }
    }).catchError((error)
    {
      emit(AppGetTechnicalsErrorState(error));
    });
  }

  // Get User Data To stay Login
  UserModel? userModel;

  void getUserData() {
    emit(AppGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(AppGetUserSuccessState());
    }).catchError((error) {
      emit(AppGetUserErrorState(error.toString()));
    });
  }

  // Get Document IDs to start access to all data in document in firebase
  List<String> allDocIDs = [];

  Future getAllDocId({required String city}) async
  {
    emit(AppGetDocIDsLoadingState());
    allDocIDs.clear();
    await FirebaseFirestore.instance.collection(city).doc(city).collection('requests').get().then((
        snapshot) {
      for (var document in snapshot.docs) {
        allDocIDs.add(document.reference.id);
        emit(AppGetDocIDsSuccessState());
      }
    }).catchError((error)
    {
      emit(AppGetDocIDsErrorState(error));
    });
  }

  // Get Document IDs to start access to all data in document in firebase
  List<String> doneDocIDs = [];

  Future getDoneDocId({required String city}) async
  {
    emit(AppGetDoneDocIDsLoadingState());
    doneDocIDs.clear();
    await FirebaseFirestore.instance.collection(city).doc(city).collection('doneRequests').get().then((
        snapshot) {
      for (var document in snapshot.docs) {
        doneDocIDs.add(document.reference.id);
        emit(AppGetDoneDocIDsSuccessState());
      }
    }).catchError((error)
    {
      emit(AppGetDoneDocIDsErrorState(error));
    });
  }


  // Get Document IDs to start access to all data in document in firebase
  List<String> archivedDocIDs = [];

  Future getArchivedDocId({required String city}) async
  {
    archivedDocIDs.clear();
    emit(AppGetArchivedDocIDsLoadingState());
    await FirebaseFirestore.instance.collection(city).doc(city).collection('archivedRequests').get().then((
        snapshot) {
      for (var document in snapshot.docs) {
        archivedDocIDs.add(document.reference.id);
        emit(AppGetArchivedDocIDsSuccessState());
      }
    }).catchError((error)
    {
      emit(AppGetArchivedDocIDsErrorState(error));
    });
  }

  // Get Cities IDs to start access to all data in document in firebase
  List<String> allCities = [];

  Future getCitiesId({required String city}) async
  {

    emit(AppGetCitiesLoadingState());
    allCities.clear();
    await FirebaseFirestore.instance.collection(city).doc(city).collection('cities').get().then((
        snapshot) {
      for (var document in snapshot.docs) {
        allCities.add(document.reference.id);
        emit(AppGetCitiesSuccessState());
      }
    }).catchError((error)
    {
      emit(AppGetCitiesErrorState(error));
    });
  }

  // Get Companies IDs to start access to all data in document in firebase
  List<String> allCompanies = [];

  Future getCompaniesId({required String city}) async
  {

    emit(AppGetCompaniesLoadingState());
    allCompanies.clear();
    await FirebaseFirestore.instance.collection(city).doc(city).collection('companies').get().then((
        snapshot) {
      for (var document in snapshot.docs) {
        allCompanies.add(document.reference.id);
        emit(AppGetCompaniesSuccessState());
      }
    }).catchError((error)
    {
      emit(AppGetCompaniesErrorState(error));
    });
  }

  // Get Machines IDs to start access to all data in document in firebase
  List<String> allMachines = [];

  Future getMachinesId({required String city}) async
  {

    emit(AppGetMachinesLoadingState());
    allMachines.clear();
    await FirebaseFirestore.instance.collection(city).doc(city).collection('machines').get().then((
        snapshot) {
      for (var document in snapshot.docs) {
        allMachines.add(document.reference.id);
        emit(AppGetMachinesSuccessState());
      }
    }).catchError((error)
    {
      emit(AppGetMachinesErrorState(error));
    });
  }

  // Get Machines IDs to start access to all data in document in firebase
  List<String> allMachineTypes = [];

  Future getMachineTypesId({required String city}) async
  {

    emit(AppGetMachineTypesLoadingState());
    allMachineTypes.clear();
    await FirebaseFirestore.instance.collection(city).doc(city).collection('machineTypes').get().then((
        snapshot) {
      for (var document in snapshot.docs) {
        allMachineTypes.add(document.reference.id);
        emit(AppGetMachineTypesSuccessState());
      }
    }).catchError((error)
    {
      emit(AppGetMachineTypesErrorState(error));
    });
  }

  // Create and Add Item To Firebase List
  Future createItem({required String name, required String collection, required String key}) async
  {
    // Reference Document
    final docUser = FirebaseFirestore.instance.collection(collection).doc(name);
    final json = {key : name};

    // Create document and Write Data to Firebase
    await docUser.set(json);
    emit(AppGetCreateItemSuccessState());
  }

  // Update Items
  Future updateItem({required String collection, required String key, required index, required updatedName,}) async
  {
    final docUser = FirebaseFirestore.instance.collection(collection).doc(index);
    docUser.update({key: updatedName});
  }

  // Delete Items
  Future deleteItem({required String collection, required index}) async
  {
    final docUser = FirebaseFirestore.instance.collection(collection).doc(index);
    docUser.delete();
    //getCitiesId();
    emit(AppGetDeleteItemSuccessState());
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheet({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
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
