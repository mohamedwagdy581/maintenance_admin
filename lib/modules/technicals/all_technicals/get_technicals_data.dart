import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../shared/network/cubit/cubit.dart';

class GetTechnicalsData extends StatelessWidget {

  final String documentId;
  final String documentDataKey;

  const GetTechnicalsData({
    super.key,
    required this.documentId,
    required this.documentDataKey,
  });
  @override
  Widget build(BuildContext context) {
    // Get the Collection

    CollectionReference technicals = FirebaseFirestore.instance.collection('technicals');

    return FutureBuilder<DocumentSnapshot>(
      future: technicals.doc(documentId).get(),
        builder: (context, snapshot)
        {
          if(snapshot.connectionState == ConnectionState.done)
          {
            Map<String, dynamic> technicals = snapshot.data!.data() as Map<String, dynamic>;
            return Text(
                '${technicals[documentDataKey]}',

              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 16.0,
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
