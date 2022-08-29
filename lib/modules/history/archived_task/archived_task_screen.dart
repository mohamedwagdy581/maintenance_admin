import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_admin/shared/components/components.dart';

import '../../../shared/network/cubit/cubit.dart';
import '../../../shared/network/cubit/states.dart';

class ArchivedRequestsScreen extends StatelessWidget {
  const ArchivedRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var archivedRequests = AppCubit.get(context).archiveRequests;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Archived Requests'),
          ),
          body: archivedRequests.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) =>
                      buildRequestItem(model: archivedRequests[index], context: context),
                  separatorBuilder: (context, index) => const Divider(
                    height: 5,
                    color: Colors.grey,
                  ),
                  itemCount: archivedRequests.length,
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.menu,
                        size: 100.0,
                        color: Colors.grey,
                      ),
                      Text(
                        'No Requests Yet, Please Add Some Requests!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
