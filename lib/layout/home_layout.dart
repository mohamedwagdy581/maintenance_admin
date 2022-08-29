import 'package:flutter/material.dart';
import 'package:maintenance_admin/modules/settings/settings_screen.dart';
import 'package:maintenance_admin/shared/components/components.dart';

import '../modules/request_details/request_details.dart';
import '../modules/requests/get_requests_data.dart';
import '../shared/network/cubit/cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Requests',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: defaultTextButton(
              onPressed: () {
                navigateTo(context, const SettingsScreen());
              },
              text: 'Settings',
            ),
          ),
        ],
      ),
      // ***********************  The Scaffold Body  ***********************
      body: FutureBuilder(
        future: cubit.getDocId(),
        builder: (context, snapshot) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            itemBuilder: (context, index) => customListTile(
              onTapped: () {
                navigateTo(
                    context,
                    RequestDetails(
                      requestCompanyName: GetRequestsData(
                          documentId: cubit.docIDs[index],
                          documentDataKey: 'companyName',
                      ),
                      requestCompanyCity: GetRequestsData(
                          documentId: cubit.docIDs[index],
                          documentDataKey: 'city',
                      ),
                      requestCompanySchool: GetRequestsData(
                          documentId: cubit.docIDs[index],
                          documentDataKey: 'school',
                      ),
                      requestCompanyMachine: GetRequestsData(

                          documentId: cubit.docIDs[index],
                          documentDataKey: 'machine',
                      ),
                      requestCompanyMachineType: GetRequestsData(
                          documentId: cubit.docIDs[index],
                          documentDataKey: 'machineType',
                      ),
                      requestCompanyConsultation: GetRequestsData(
                          documentId: cubit.docIDs[index],
                          documentDataKey: 'consultation',
                      ),
                      /*archivedRequestsData: archivedRequests[index],
                      doneRequestsData: doneRequests[index],*/
                    ));
                //print(cubit.docIDs[index]);
              },
              title: GetRequestsData(
                  documentId: cubit.docIDs[index],
                  documentDataKey: 'companyName',
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
                  Icons.chevron_right,
                  color: AppCubit.get(context).isDark
                      ? Colors.blue
                      : Colors.deepOrange,
                ),
              ),
            ),
            separatorBuilder: (context, index) => const Divider(
              thickness: 2.0,
            ),
            itemCount: cubit.docIDs.length,
          );
        },
      ),
    );
  }
}
