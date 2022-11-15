import 'package:flutter/material.dart';
import 'package:maintenance_admin/modules/request_details/request_details.dart';
import 'package:maintenance_admin/modules/requests/all_requests/get_requests_data.dart';
import 'package:maintenance_admin/shared/components/components.dart';

import '../../../shared/network/cubit/cubit.dart';

class ArchivedRequestsScreen extends StatelessWidget {
  final String city;
  const ArchivedRequestsScreen({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archived Requests'),
      ),
      body: FutureBuilder(
        future: cubit.getArchivedDocId(city: city),
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
                      city: city,
                      currentIndex: index,
                    ),
                );
                //print(cubit.docIDs[index]);
              },
              title: Container(
                alignment: AlignmentDirectional.center,
                child: GetRequestsData(
                  city: city,
                  collection: 'archivedRequests',
                  documentId: cubit.archivedDocIDs[index],
                  documentDataKey: 'technicalName',
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
