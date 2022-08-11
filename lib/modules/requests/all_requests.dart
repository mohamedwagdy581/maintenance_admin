import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/network/cubit/cubit.dart';
import '../../style/custom_icons.dart';
import '../request_details/request_details.dart';
import 'get_requests_data.dart';

class AllRequestsScreen extends StatelessWidget {
  const AllRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return FutureBuilder(
      future: cubit.getDocId(),
      builder: (context, snapshot) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10.0,),
          itemBuilder: (context, index) =>
              customListTile(
                onTapped: ()
                {
                  navigateTo(context, RequestDetails(
                    requestCompanyName: GetRequestsData(documentId: cubit.docIDs[index], documentSchool: 'companyName'),
                    requestCompanyCity: GetRequestsData(documentId: cubit.docIDs[index], documentSchool: 'city'),
                    requestCompanySchool: GetRequestsData(documentId: cubit.docIDs[index], documentSchool: 'school'),
                    requestCompanyMachine: GetRequestsData(documentId: cubit.docIDs[index], documentSchool: 'machine'),
                    requestCompanyMachineType: GetRequestsData(documentId: cubit.docIDs[index], documentSchool: 'machineType'),
                    requestCompanyConsultation: GetRequestsData(documentId: cubit.docIDs[index], documentSchool: 'consultation'),
                  ));
                  //print(cubit.docIDs[index]);
                },
                title: GetRequestsData(documentId: cubit.docIDs[index], documentSchool: 'companyName'),
                leadingWidget: Icon(
                  Icons.history_outlined,
                  color:
                  AppCubit.get(context).isDark ? Colors.blue : Colors.deepOrange,
                ),
                trailingWidget: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    CustomIcons.arrow_right,
                    color:
                    AppCubit.get(context).isDark ? Colors.blue : Colors.deepOrange,
                  ),
                ),
              ),
          separatorBuilder: (context, index) =>
          const Divider(thickness: 2.0,),
          itemCount: cubit.docIDs.length,
        );
      },
    );
  }

}
