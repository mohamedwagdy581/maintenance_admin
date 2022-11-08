import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../shared/network/cubit/cubit.dart';

class GetUsersData extends StatelessWidget {

  final String documentId;
  final String documentDataKey;

  const GetUsersData({
    super.key,
    required this.documentId,
    required this.documentDataKey,
  });
  @override
  Widget build(BuildContext context) {
    // Get the Collection

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
        builder: (context, snapshot)
        {
          if(snapshot.connectionState == ConnectionState.done)
          {
            Map<String, dynamic> users = snapshot.data!.data() as Map<String, dynamic>;
            return Text(
                '${users[documentDataKey]}',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppCubit.get(context).isDark
                    ? Colors.black
                    : Colors.white,
              ),
            );
          }
          return const Text('Loading ....');
          },
    );
  }
}
