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

// App Get All Users IDs State
class AppGetUsersLoadingState extends AppStates {}

class AppGetUsersSuccessState extends AppStates {}

class AppGetUsersErrorState extends AppStates
{
  final String error;

  AppGetUsersErrorState(this.error);
}

// App Get All Technicals IDs State
class AppGetTechnicalsLoadingState extends AppStates {}

class AppGetTechnicalsSuccessState extends AppStates {}

class AppGetTechnicalsErrorState extends AppStates
{
  final String error;

  AppGetTechnicalsErrorState(this.error);
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

// App Get All Cities IDs State
class AppGetCitiesLoadingState extends AppStates {}

class AppGetCitiesSuccessState extends AppStates {}

class AppGetCitiesErrorState extends AppStates
{
  final String error;

  AppGetCitiesErrorState(this.error);
}

// App Get All Companies IDs State
class AppGetCompaniesLoadingState extends AppStates {}

class AppGetCompaniesSuccessState extends AppStates {}

class AppGetCompaniesErrorState extends AppStates
{
  final String error;

  AppGetCompaniesErrorState(this.error);
}

// App Get All Machines IDs State
class AppGetMachinesLoadingState extends AppStates {}

class AppGetMachinesSuccessState extends AppStates {}

class AppGetMachinesErrorState extends AppStates
{
  final String error;

  AppGetMachinesErrorState(this.error);
}

// App Get All Machine Types IDs State
class AppGetMachineTypesLoadingState extends AppStates {}

class AppGetMachineTypesSuccessState extends AppStates {}

class AppGetMachineTypesErrorState extends AppStates
{
  final String error;

  AppGetMachineTypesErrorState(this.error);
}

// CRUD
class AppGetCreateItemSuccessState extends AppStates {}
class AppGetDeleteItemSuccessState extends AppStates {}
class AppGetEditItemSuccessState extends AppStates {}


class AppChangeBottomSheetState extends AppStates {}

// Change Mode Theme of App
class AppChangeModeThemeState extends AppStates {}





