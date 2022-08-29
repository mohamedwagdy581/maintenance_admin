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

  // CRUD Local Database
  late Database database;
  List<Map> newRequests = [];
  List<Map> doneRequests = [];
  List<Map> archiveRequests = [];

  // Start Crating Database
  void createDatabase() {
    openDatabase(
      'requests.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY, companyName TEXT, city TEXT, school TEXT, machine TEXT, machineType TEXT, consultation TEXT)')
            .then((value) {})
            .catchError((error) {
          print('Error when create table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('Database Opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  // Insert items to Database
  insertToDatabase({
    required String companyName,
    required String city,
    required String school,
    required String machine,
    required String machineType,
    required String consultation,
    required String status,
  }) async {
    await database.transaction((txn) => txn
        .rawInsert(
        'INSERT INTO tasks(companyName, city, school, machine, machineType, consultation, status) VALUES("$companyName", "$city", "$school", "$machine","$machineType", "$consultation", "new")')
        .then((value) {
      print('$value inserted successfully');
      emit(AppInsertDatabaseState());

      getDataFromDatabase(database);
    }).catchError((error) {
      print('Error when inserting record ${error.toString()}');
    }));
  }

  // Get Data from Database
  getDataFromDatabase(database) {
    newRequests = [];
    doneRequests = [];
    archiveRequests = [];
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newRequests.add(element);
        } else if (element['status'] == 'done') {
          doneRequests.add(element);
        } else {
          archiveRequests.add(element);
        }
      });
      emit(AppGetDatabaseState());
    });
  }

  // Update Record
  void updateData({required String status, required int id}) {
    database.rawUpdate(
      'UPDATE requests SET status = ? WHERE id = ?',
      [status, id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  // Delete Record
  void deleteData({required int id}) {
    database.rawUpdate(
      'DELETE FROM requests WHERE id = ?',
      [id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
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
