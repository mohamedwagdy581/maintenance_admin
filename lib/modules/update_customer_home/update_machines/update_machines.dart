import 'package:flutter/material.dart';
import 'package:maintenance_admin/modules/settings/settings_screen.dart';
import 'package:maintenance_admin/shared/components/components.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/network/cubit/cubit.dart';
import '../../requests/all_requests/get_requests_data.dart';

class UpdateMachines extends StatefulWidget {
  const UpdateMachines({Key? key}) : super(key: key);

  @override
  State<UpdateMachines> createState() => _UpdateCompaniesListState();
}

class _UpdateCompaniesListState extends State<UpdateMachines> {
  final _formKey = GlobalKey<FormState>();

  List<String> sugars = ['1', '2', '3', '4', '5',];

  // Form values
  late String _currentName;


  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Machines',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      // ***********************  The Scaffold Body  ***********************
      body: FutureBuilder(
        future: cubit.getMachinesId(),
        builder: (context, snapshot) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            itemBuilder: (context, index) => customListTile(
              onTapped: () {
                /*navigateTo(
                    context,
                    RequestDetails(
                      requestCompanyName: GetRequestsData(
                        documentId: cubit.allDocIDs[index],
                        documentDataKey: 'companyName',
                      ),
                      requestCompanyCity: GetRequestsData(
                        documentId: cubit.allDocIDs[index],
                        documentDataKey: 'city',
                      ),
                      requestCompanySchool: GetRequestsData(
                        documentId: cubit.allDocIDs[index],
                        documentDataKey: 'school',
                      ),
                      requestCompanyMachine: GetRequestsData(

                        documentId: cubit.allDocIDs[index],
                        documentDataKey: 'machine',
                      ),
                      requestCompanyMachineType: GetRequestsData(
                        documentId: cubit.allDocIDs[index],
                        documentDataKey: 'machineType',
                      ),
                      requestCompanyConsultation: GetRequestsData(
                        documentId: cubit.allDocIDs[index],
                        documentDataKey: 'consultation',
                      ),
                      *//*archivedRequestsData: archivedRequests[index],
                      doneRequestsData: doneRequests[index],*//*
                    ));*/
                //print(cubit.docIDs[index]);
              },
              title: Container(
                alignment: AlignmentDirectional.center,
                child: GetRequestsData(
                  collection: 'machines',
                  documentId: cubit.allMachines[index],
                  documentDataKey: 'machineName',
                ),
              ),
              leadingWidget: Icon(
                Icons.history_outlined,
                color: AppCubit.get(context).isDark
                    ? Colors.blue
                    : Colors.deepOrange,
              ),
              trailingWidget: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.delete_forever,
                  color: AppCubit.get(context).isDark
                      ? Colors.red
                      : Colors.deepOrange,
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
      floatingActionButton: FloatingActionButton(onPressed: ()
      {
        _showUpdatePanel();
      },
        child: const Icon(Icons.edit,color: Colors.white,),
      ),
    );
  }

  void _showUpdatePanel()
  {
    showModalBottomSheet(
        context: context,
        builder: (context)
        {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text('Update Your Lists.',style: TextStyle(fontSize: 18.0,),),
                  const SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: textInputDecoration,
                    validator: (val) => val!.isEmpty ? 'Please Enter Name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  const SizedBox(height: 20.0,),
                  //
                  //
                  defaultButton(
                    backgroundColor: Colors.pink[400],
                    onPressed: () async
                    {
                      print(_currentName);
                    },
                    text: 'Update',
                  ),
                ],
              ),
            ),
          );
        });
  }
}
