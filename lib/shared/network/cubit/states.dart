abstract class AppStates {}

// App Initial State
class AppInitialState extends AppStates {}

// App Get User State
class AppGetUserLoadingState extends AppStates {}

class AppGetUserSuccessState extends AppStates {}

class AppGetUserErrorState extends AppStates
{
  final String error;

  AppGetUserErrorState(this.error);
}

// App Get All Document IDs State
class AppGetDocIDsLoadingState extends AppStates {}

class AppGetDocIDsSuccessState extends AppStates {}

class AppGetDocIDsErrorState extends AppStates
{
  final String error;

  AppGetDocIDsErrorState(this.error);
}

// CRUD Database
class AppCreateDatabaseState extends AppStates {}

class AppInsertDatabaseState extends AppStates {}

class AppGetDatabaseState extends AppStates {}

class AppUpdateDatabaseState extends AppStates {}

class AppDeleteDatabaseState extends AppStates {}


// Change Mode Theme of App
class AppChangeModeThemeState extends AppStates {}

