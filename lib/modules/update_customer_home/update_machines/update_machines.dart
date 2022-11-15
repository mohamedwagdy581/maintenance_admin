import 'package:flutter/material.dart';
import 'package:maintenance_admin/shared/components/components.dart';

import '../../../shared/network/cubit/cubit.dart';
import '../../requests/all_requests/get_requests_data.dart';

class UpdateMachines extends StatefulWidget {
  const UpdateMachines({Key? key}) : super(key: key);

  @override
  State<UpdateMachines> createState() => _UpdateCompaniesListState();
}

class _UpdateCompaniesListState extends State<UpdateMachines> {
  final _formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var machineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Machines',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      // ***********************  The Scaffold Body  ***********************
      body: RefreshIndicator(
        onRefresh: () async
        {
          cubit.allMachineTypes.clear();
          setState(() {

          });
        },
        child: FutureBuilder(
          future: cubit.getMachinesId(city: ''),
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
                    city: '',
                    collection: 'machines',
                    documentId: cubit.allMachines[index],
                    documentDataKey: 'machineName',
                  ),
                ),
                leadingWidget: InkWell(
                  onTap: () async {
                    final updatedName = await openDialog();
                    if(updatedName == null || updatedName.isEmpty) return;
                    cubit.updateItem(
                      collection: 'machines',
                      key: 'machineName',
                      index: cubit.allMachines[index],
                      updatedName: machineController.text,
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
                      collection: 'machines',
                      index: cubit.allMachines[index],
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
              itemCount: cubit.allMachines.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (cubit.isBottomSheetShown) {
            if (_formKey.currentState!.validate()) {
              final String machine =
                  machineController.text;
              //createUser(name: name);
              cubit.createItem(
                  name: machine,
                  collection: 'machines',
                  key: 'machineName');
              machineController.clear();
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
                                controller: machineController,
                                keyboardType: TextInputType.visiblePassword,
                                label: 'Add Machine',
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
                                    return 'Please Enter Machine Name';
                                  }
                                  return null;
                                },
                                prefix: Icons.add_chart,
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
                                    final String machine =
                                        machineController.text;
                                    //createUser(name: name);
                                    cubit.createItem(
                                        name: machine,
                                        collection: 'machines',
                                        key: 'machineName');
                                    machineController.clear();
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

  Future<String?> openDialog() => showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Update City'),
      content: defaultTextFormField(
        controller: machineController,
        keyboardType: TextInputType.visiblePassword,
        label: 'Update City',
        textStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
          color: AppCubit.get(context).isDark
              ? Colors.black
              : Colors.white,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Please Enter City Name';
          }
          return null;
        },
        prefix: Icons.location_city_rounded,
        prefixColor:
        AppCubit.get(context).isDark ? Colors.black : Colors.white,
      ),
      actions: [
        defaultTextButton(
          onPressed: () {
            Navigator.of(context).pop(machineController.text);
          },
          text: 'Update',
        ),
      ],
    ),
  );
}
