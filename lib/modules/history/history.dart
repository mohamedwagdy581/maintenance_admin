import 'package:flutter/material.dart';
import 'package:maintenance_admin/shared/components/components.dart';

import '../requests/archived_requests/archived_requests_screen.dart';
import '../requests/done_requests/done_requests_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('History Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildRequestsCard(
              context: context,
              onTap: ()
              {
                navigateTo(context, const DoneRequestsScreen());
              },
              text: 'Done Requests',
              height: height,
              width: width,
              cardColor: Colors.green,
            ),
            const SizedBox(
              height: 50.0,
            ),
            buildRequestsCard(
              context: context,
              onTap: ()
              {
                navigateTo(context, const ArchivedRequestsScreen());
              },
              text: 'Archived Requests',
              height: height,
              width: width,
              cardColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRequestsCard({
    context,
    required String text,
    required VoidCallback onTap,
    Color? cardColor,
    double? height,
    double? width,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: height! * 0.25,
          width: width! * 0.52,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Card(
            color: cardColor,
            elevation: 20.0,
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ),
      );
}
