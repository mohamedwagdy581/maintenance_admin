import 'package:flutter/material.dart';
import 'package:maintenance_admin/modules/requests/all_requests/get_requests_data.dart';
import 'package:maintenance_admin/shared/components/components.dart';

import '../../../shared/network/cubit/cubit.dart';
import '../../request_details/request_details.dart';

class DoneRequestsScreen extends StatelessWidget {
  const DoneRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Requests'),
      ),
      body: FutureBuilder(
        future: cubit.getDoneDocId(),
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
                        collection: 'doneRequests',
                        documentId: cubit.doneDocIDs[index],
                        documentDataKey: 'companyName',
                      ),
                      requestCompanyCity: GetRequestsData(
                        collection: 'doneRequests',
                        documentId: cubit.doneDocIDs[index],
                        documentDataKey: 'city',
                      ),
                      requestCompanySchool: GetRequestsData(
                        collection: 'doneRequests',
                        documentId: cubit.doneDocIDs[index],
                        documentDataKey: 'school',
                      ),
                      requestCompanyMachine: GetRequestsData(
                        collection: 'doneRequests',

                        documentId: cubit.doneDocIDs[index],
                        documentDataKey: 'machine',
                      ),
                      requestCompanyMachineType: GetRequestsData(
                        collection: 'doneRequests',
                        documentId: cubit.doneDocIDs[index],
                        documentDataKey: 'machineType',
                      ),
                      requestCompanyConsultation: GetRequestsData(
                        collection: 'doneRequests',
                        documentId: cubit.doneDocIDs[index],
                        documentDataKey: 'consultation',
                      ),
                    ));
              },
              title: GetRequestsData(
                collection: 'doneRequests',
                documentId: cubit.doneDocIDs[index],
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
            itemCount: cubit.doneDocIDs.length,
          );
        },
      ),
    );
  }
}
