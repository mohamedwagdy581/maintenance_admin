import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../shared/network/cubit/cubit.dart';

class GetRequestsData extends StatelessWidget {

  final String documentId;
  final String documentSchool;

  const GetRequestsData({
    super.key,
    required this.documentId,
    required this.documentSchool,
  });
  @override
  Widget build(BuildContext context) {
    // Get the Collection

    CollectionReference requests = FirebaseFirestore.instance.collection('requests');

    return FutureBuilder<DocumentSnapshot>(
      future: requests.doc(documentId).get(),
        builder: (context, snapshot)
        {
          if(snapshot.connectionState == ConnectionState.done)
          {
            Map<String, dynamic> requests = snapshot.data!.data() as Map<String, dynamic>;
            return Text(
                '${requests[documentSchool]}',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                color: AppCubit.get(context).isDark
                    ? Colors.blue
                    : Colors.deepOrange,
              ),
            );
          }
          return const Text('Loading ....');
          },
    );
  }
}