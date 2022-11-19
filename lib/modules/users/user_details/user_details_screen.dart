import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/home_layout.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/cubit/cubit.dart';
import '../../../shared/network/cubit/states.dart';

class UserDetailsScreen extends StatelessWidget {
  final int index;
  final String city;
  const UserDetailsScreen({Key? key, required this.index, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> dataStream = FirebaseFirestore.instance.collection(city).doc(city).collection('users').snapshots();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
          ),
          body: StreamBuilder<QuerySnapshot> (
            stream: dataStream,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
            {
              if(snapshot.hasError)
              {
                return Text('Something Wrong! ${snapshot.error}');
              }else if(snapshot.hasData)
              {
                final List storeDocs = [];
                snapshot.data!.docs.map((DocumentSnapshot documentSnapshot)
                {
                  Map users = documentSnapshot.data() as Map<String, dynamic>;
                  storeDocs.add(users);
                  users['uId'] = documentSnapshot.id;
                }).toList();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 190.0,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Container(
                                height: 140.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(storeDocs[index]['cover']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 64.0,
                              backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: NetworkImage(storeDocs[index]['image']),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),

                      buildUserDetails(
                        context: context,
                        text: 'User Name : ',
                        title: storeDocs[index]['name'],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      buildUserDetails(
                        context: context,
                        text: 'User ID : ',
                        title: storeDocs[index]['id'],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      buildUserDetails(
                        context: context,
                        text: 'User Email : ',
                        title: storeDocs[index]['email'],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      buildUserDetails(
                        context: context,
                        text: 'User Phone : ',
                        title: storeDocs[index]['phone'],
                      ),
                    ],
                  ),
                );
              }else
              {
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navigateAndFinish(context, const HomeLayout());
            },
            child: const Icon(Icons.home),
          ),
        );
      },
    );
  }
  Widget buildUserDetails(
      {
        required String text,
        required String title,
        required context,
      }) =>Padding(
    padding: const EdgeInsets.only(left: 10.0),
    child: Wrap(
      children: [
        Text(text,style: const TextStyle(fontSize: 16.0),),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    ),
  );
}
