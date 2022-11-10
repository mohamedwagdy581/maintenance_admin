import 'package:flutter/material.dart';
import 'package:maintenance_admin/shared/components/components.dart';

import '../../../shared/network/cubit/cubit.dart';
import '../../requests/all_requests/get_requests_data.dart';

class UpdateCompaniesList extends StatefulWidget {
  const UpdateCompaniesList({Key? key}) : super(key: key);

  @override
  State<UpdateCompaniesList> createState() => _UpdateCompaniesListState();
}

class _UpdateCompaniesListState extends State<UpdateCompaniesList> {
  final _formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var companyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Companies',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      // ***********************  The Scaffold Body  ***********************
      body: RefreshIndicator(
        onRefresh: () async
        {
          cubit.allCompanies.clear();
          setState(() {

          });
        },
        child: FutureBuilder(
          future: cubit.getCompaniesId(),
          builder: (context, snapshot) {
            return ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              itemBuilder: (context, index) => customListTile(
                title: Container(
                  alignment: AlignmentDirectional.center,
                  child: GetRequestsData(
                    collection: 'companies',
                    documentId: cubit.allCompanies[index],
                    documentDataKey: 'companyName',
                  ),
                ),
                leadingWidget: InkWell(
                  onTap: () {
                    cubit.updateItem(
                      collection: 'companies',
                      key: 'companyName',
                      index: cubit.allCompanies[index],
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.edit,
                      color: AppCubit.get(context).isDark
                          ? Colors.blue
                          : Colors.deepOrange,
                    ),
                  ),
                ),
                trailingWidget: InkWell(
                  onTap: () {
                    cubit.deleteItem(
                      collection: 'companies',
                      index: cubit.allCompanies[index],
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.delete_forever,
                      color: AppCubit.get(context).isDark
                          ? Colors.red
                          : Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const Divider(
                thickness: 2.0,
              ),
              itemCount: cubit.allCompanies.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (cubit.isBottomSheetShown) {
            if (_formKey.currentState!.validate()) {
              final String company =
                  companyController.text;
              //createUser(name: name);
              cubit.createItem(
                  name: company,
                  collection: 'companies',
                  key: 'companyName');
              companyController.clear();
              Navigator.pop(context);
            }
          } else {
            scaffoldKey.currentState!
                .showBottomSheet(
                  (context) => SizedBox(
                    height: 300.0,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Update Your List.',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              // TextFormField of Password
                              defaultTextFormField(
                                controller: companyController,
                                keyboardType: TextInputType.visiblePassword,
                                label: 'Add Company',
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      color: AppCubit.get(context).isDark
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Company Name';
                                  }
                                  return null;
                                },
                                prefix: Icons.business,
                                prefixColor: AppCubit.get(context).isDark
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              //
                              //
                              defaultButton(
                                backgroundColor: Colors.pink[400],
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final String company =
                                        companyController.text;
                                    //createUser(name: name);
                                    cubit.createItem(
                                        name: company,
                                        collection: 'companies',
                                        key: 'companyName');
                                    companyController.clear();
                                    Navigator.pop(context);
                                  }
                                },
                                text: 'Update',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  elevation: 20.0,
                )
                .closed
                .then((value) {
              cubit.changeBottomSheet(isShow: false, icon: Icons.edit);
            });
            cubit.changeBottomSheet(isShow: true, icon: Icons.add);
          }
        },
        child: Icon(
          cubit.fabIcon,
        ),
      ),
    );
  }
}
