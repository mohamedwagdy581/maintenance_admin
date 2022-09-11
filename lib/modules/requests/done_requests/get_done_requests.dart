import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../shared/network/cubit/cubit.dart';

class GetDoneRequests extends StatelessWidget {

  final String documentId;
  final String documentDataKey;

  const GetDoneRequests({
    super.key,
    required this.documentId,
    required this.documentDataKey,
  });
  @override
  Widget build(BuildContext context) {
    // Get the Collection

    CollectionReference requests = FirebaseFirestore.instance.collection('doneRequests');

    return FutureBuilder<DocumentSnapshot>(
      future: requests.doc(documentId).get(),
      builder: (context, snapshot)
      {
        if(snapshot.connectionState == ConnectionState.done)
        {
          final Map requests = snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            '${requests[documentDataKey]}',
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
