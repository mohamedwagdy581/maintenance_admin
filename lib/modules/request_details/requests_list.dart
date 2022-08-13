
import 'package:flutter/material.dart';

class AllRequests extends StatelessWidget {
  const AllRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget buildRequestsList(
  {
    required VoidCallback onTap,
    required String title,
}) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            onTap: onTap,
            title: Text(title),
          ),
          separatorBuilder: (context, index) => const Divider(thickness: 2.0,),
          itemCount: 10,
        ),
  );
}
