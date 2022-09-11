import 'package:flutter/material.dart';
import 'package:maintenance_admin/modules/request_details/archived_done_details_screen.dart';
import 'package:maintenance_admin/modules/requests/archived_requests/get_archived_requests.dart';
import 'package:maintenance_admin/shared/components/components.dart';

import '../../../shared/network/cubit/cubit.dart';

class ArchivedRequestsScreen extends StatelessWidget {
  const ArchivedRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archived Requests'),
      ),
      body: FutureBuilder(
        future: cubit.getArchivedDocId(),
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
                    ArchivedAndDoneRequestDetailsScreen(
                      requestCompanyName: GetArchivedRequestsData(
                        documentId: cubit.archivedDocIDs[index],
                        documentDataKey: 'companyName',
                      ),
                      requestCompanyCity: GetArchivedRequestsData(
                        documentId: cubit.archivedDocIDs[index],
                        documentDataKey: 'city',
                      ),
                      requestCompanySchool: GetArchivedRequestsData(
                        documentId: cubit.archivedDocIDs[index],
                        documentDataKey: 'school',
                      ),
                      requestCompanyMachine: GetArchivedRequestsData(

                        documentId: cubit.archivedDocIDs[index],
                        documentDataKey: 'machine',
                      ),
                      requestCompanyMachineType: GetArchivedRequestsData(
                        documentId: cubit.archivedDocIDs[index],
                        documentDataKey: 'machineType',
                      ),
                      requestCompanyConsultation: GetArchivedRequestsData(
                        documentId: cubit.archivedDocIDs[index],
                        documentDataKey: 'consultation',
                      ),
                      /*archivedRequestsData: archivedRequests[index],
                      doneRequestsData: doneRequests[index],*/
                    ));
                //print(cubit.docIDs[index]);
              },
              title: GetArchivedRequestsData(
                documentId: cubit.archivedDocIDs[index],
                documentDataKey: 'technicalName',
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
            itemCount: cubit.archivedDocIDs.length,
          );
        },
      ),
    );
  }
}
