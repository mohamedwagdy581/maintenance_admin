import 'package:flutter/material.dart';
import 'package:maintenance_admin/modules/requests/all_requests/get_requests_data.dart';
import 'package:maintenance_admin/modules/technicals/technical_details/technical_details_screen.dart';

import '../../../layout/home_layout.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/cubit/cubit.dart';

class AllTechnicalsScreen extends StatelessWidget {
  final String city;
  const AllTechnicalsScreen({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Technicals',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      // ***********************  The Scaffold Body  ***********************
      body: FutureBuilder(
        future: cubit.getAllTechnicals(city: city),
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
                  TechnicalDetailsScreen(
                    index: index,
                    city: city,
                  ),
                );
                //print(cubit.docIDs[index]);
              },
              title: GetRequestsData(
                city: city,
                documentId: cubit.allTechnicals[index],
                documentDataKey: 'name',
                  collection: 'technicals',
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
            itemCount: cubit.allTechnicals.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateAndFinish(context, const HomeLayout());
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
