import 'package:flutter/material.dart';
import 'package:maintenance_admin/modules/requests/done_requests/get_done_requests.dart';
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
                      requestCompanyName: GetDoneRequests(
                        documentId: cubit.doneDocIDs[index],
                        documentDataKey: 'companyName',
                      ),
                      requestCompanyCity: GetDoneRequests(
                        documentId: cubit.doneDocIDs[index],
                        documentDataKey: 'city',
                      ),
                      requestCompanySchool: GetDoneRequests(
                        documentId: cubit.doneDocIDs[index],
                        documentDataKey: 'school',
                      ),
                      requestCompanyMachine: GetDoneRequests(

                        documentId: cubit.doneDocIDs[index],
                        documentDataKey: 'machine',
                      ),
                      requestCompanyMachineType: GetDoneRequests(
                        documentId: cubit.doneDocIDs[index],
                        documentDataKey: 'machineType',
                      ),
                      requestCompanyConsultation: GetDoneRequests(
                        documentId: cubit.doneDocIDs[index],
                        documentDataKey: 'consultation',
                      ),
                    ));
              },
              title: GetDoneRequests(
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
