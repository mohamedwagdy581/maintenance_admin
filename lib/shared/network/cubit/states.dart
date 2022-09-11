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

// App Get All Document IDs State
class AppGetDoneDocIDsLoadingState extends AppStates {}

class AppGetDoneDocIDsSuccessState extends AppStates {}

class AppGetDoneDocIDsErrorState extends AppStates
{
  final String error;

  AppGetDoneDocIDsErrorState(this.error);
}

// App Get All Document IDs State
class AppGetArchivedDocIDsLoadingState extends AppStates {}

class AppGetArchivedDocIDsSuccessState extends AppStates {}

class AppGetArchivedDocIDsErrorState extends AppStates
{
  final String error;

  AppGetArchivedDocIDsErrorState(this.error);
}


// Change Mode Theme of App
class AppChangeModeThemeState extends AppStates {}

