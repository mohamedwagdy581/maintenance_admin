import 'package:flutter/material.dart';
import 'package:maintenance_admin/modules/requests/all_requests/requests.dart';
import 'package:maintenance_admin/modules/requests/archived_requests/archived_requests_screen.dart';
import 'package:maintenance_admin/modules/requests/done_requests/done_requests_screen.dart';
import 'package:maintenance_admin/modules/settings/settings_screen.dart';
import 'package:maintenance_admin/modules/users/all_users/all_users_screen.dart';
import 'package:maintenance_admin/shared/components/components.dart';

import '../modules/technicals/all_technicals/all_technicals_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
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
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customCard(
                  onTap: () {
                    navigateTo(context, const AllRequests());
                  },
                  title: 'All Requests'),
              customCard(
                  onTap: () {
                    navigateTo(context, const DoneRequestsScreen());
                  },
                  title: 'Done Requests'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customCard(
                  onTap: () {
                    navigateTo(context, const ArchivedRequestsScreen());
                  },
                  title: 'Archived Requests'),
              customCard(
                  onTap: () {
                    navigateTo(context, const AllTechnicalsScreen());
                  },
                  title: 'All Technicals',
              ),
            ],
          ),
          customCard(
            onTap: () {
              navigateTo(context, const AllUsersScreen());
            },
            title: 'All Users',
          ),
        ],
      ),
    );
  }

}
