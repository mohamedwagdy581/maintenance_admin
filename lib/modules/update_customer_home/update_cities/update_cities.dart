import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_admin/shared/components/components.dart';

import '../../../shared/network/cubit/cubit.dart';
import '../../requests/all_requests/get_requests_data.dart';

class UpdateCities extends StatefulWidget {
  const UpdateCities({Key? key}) : super(key: key);

  @override
  State<UpdateCities> createState() => _UpdateCompaniesListState();
}

class _UpdateCompaniesListState extends State<UpdateCities> {
  final _formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var cityController = TextEditingController();
  var updateCityController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Cities',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      // ***********************  The Scaffold Body  ***********************
      body: RefreshIndicator(
        onRefresh: () async
        {
          cubit.allCities.clear();
          setState(() {});
        },
        child: FutureBuilder(
          future: cubit.getCitiesId(),
          builder: (context, snapshot) {
            return ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              itemBuilder: (context, index)
              {
                return customListTile(
                  title: Container(
                    alignment: AlignmentDirectional.center,
                    child: GetRequestsData(
                      collection: 'cities',
                      documentId: cubit.allCities[index],
                      documentDataKey: 'city',
                    ),
                  ),
                  leadingWidget: InkWell(
                    onTap: () async {
                      final updatedName = await openDialog();
                      if(updatedName == null || updatedName.isEmpty) return;
                      cubit.updateItem(
                        collection: 'cities',
                        key: 'city',
                        index: cubit.allCities[index],
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
                        collection: 'cities',
                        index: cubit.allCities[index],
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
                );
                },
              separatorBuilder: (context, index) => const Divider(
                thickness: 2.0,
              ),
              itemCount: cubit.allCities.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (cubit.isBottomSheetShown) {
            if (_formKey.currentState!.validate()) {
                final String name = cityController.text;
                //createUser(name: name);
                cubit.createItem(
                  name: name,
                  collection: 'cities',
                  key: 'city',
                );
                cityController.clear();
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
                                controller: cityController,
                                keyboardType: TextInputType.visiblePassword,
                                label: 'Add City',
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
                                    return 'Please Enter City Name';
                                  }
                                  return null;
                                },
                                prefix: Icons.location_city_rounded,
                                prefixColor: AppCubit.get(context).isDark
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              //
                              defaultButton(
                                backgroundColor: Colors.pink[400],
                                onPressed: () async {
                                  if(_formKey.currentState!.validate())
                                  {
                                    final String name = cityController.text;
                                    cubit.createItem(
                                      name: name,
                                      collection: 'cities',
                                      key: 'city',
                                    );
                                    cityController.clear();
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

  Future createUser({required String name}) async {
    // Reference Document
    final docUser = FirebaseFirestore.instance.collection('cities').doc(name);
    final json = {'city': name};

    // Create document and Write Data to Firebase
    await docUser.set(json);
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Update City'),
          content: defaultTextFormField(
            controller: updateCityController,
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
                Navigator.of(context).pop(updateCityController.text);
              },
              text: 'Update',
            ),
          ],
        ),
      );
/*void _showUpdatePanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: Form(
              key: _formKey,
              child: Column(
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
                  TextFormField(
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val!.isEmpty ? 'Please Enter Name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  //
                  //
                  defaultButton(
                    backgroundColor: Colors.pink[400],
                    onPressed: () async {
                      print(_currentName);
                    },
                    text: 'Update',
                  ),
                ],
              ),
            ),
          );
        });
  }*/
}
