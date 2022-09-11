import 'package:flutter/material.dart';
import 'package:maintenance_admin/modules/requests/all_requests/requests.dart';
import 'package:maintenance_admin/modules/requests/archived_requests/archived_requests_screen.dart';
import 'package:maintenance_admin/modules/requests/done_requests/done_requests_screen.dart';
import 'package:maintenance_admin/modules/settings/settings_screen.dart';
import 'package:maintenance_admin/shared/components/components.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                    navigateTo(context, const AllRequests());
                  },
                  title: 'All Technicals'),
            ],
          ),
        ],
      ),
    );
  }

  Widget customCard({
    required VoidCallback onTap,
    required String title,
  }) =>
      Container(
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.all(5.0),
        height: 200.0,
        width: 180.0,
        child: InkWell(
          onTap: onTap,
          child: Card(
            elevation: 15.0,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
}
