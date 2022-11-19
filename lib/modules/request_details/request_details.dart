import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../layout/home_layout.dart';
import '../../models/locationServices.dart';
import '../../shared/components/components.dart';


class RequestDetails extends StatefulWidget {
  final String id;
  final int currentIndex;
  final String city;

  const RequestDetails({
    super.key,
    required this.currentIndex, required this.city, required this.id,
  });

  @override
  State<RequestDetails> createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final Stream<QuerySnapshot> dataStream = FirebaseFirestore.instance.collection(widget.city).doc(widget.city).collection('requests').snapshots();

    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: dataStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
        {
          if(snapshot.hasError)
          {
            return Text('Something Wrong! ${snapshot.error}');
          }else if (snapshot.hasData)
          {
            final List storeDocs = [];
            snapshot.data!.docs.map((DocumentSnapshot documentSnapshot)
            {
              Map users = documentSnapshot.data() as Map<String, dynamic>;
              storeDocs.add(users);
              users['uId'] = documentSnapshot.id;
            }).toList();
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                var latitude = storeDocs[widget.currentIndex]['latitude'];
                var longitude = storeDocs[widget.currentIndex]['longitude'];
                return Column(
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Text(
                    'Request From : ',
                    style:
                    Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22.0),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Table(
                      defaultColumnWidth: const FixedColumnWidth(180.0),
                      border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2.5,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      children: [
                        TableRow(
                          children: [
                            customTableKeyCell(text: 'Company Name', context: context),
                            customTableValueCell(
                              text: storeDocs[widget.currentIndex]['companyName'],
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            customTableKeyCell(text: 'City', context: context),
                            customTableValueCell(
                              text: storeDocs[widget.currentIndex]['city'],
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            customTableKeyCell(text: 'School', context: context),
                            customTableValueCell(
                              text: storeDocs[widget.currentIndex]['school'],
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            customTableKeyCell(text: 'Phone', context: context),
                            customTableValueCell(
                              text: storeDocs[widget.currentIndex]['phone'],
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            customTableKeyCell(
                                text: 'Location', context: context),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20.0,
                              ),
                              child: Column(
                                children: [
                                  defaultTextButton(
                                    onPressed: ()
                                    {
                                      //locationServices.goToLocation(latitude: latitude, longitude: longitude);
                                      MapUtils.openMap(latitude: latitude, longitude: longitude);
                                    },
                                    text: 'Tap To Location',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            customTableKeyCell(text: 'Machine', context: context),
                            customTableValueCell(
                              text: storeDocs[widget.currentIndex]['machine'],
                            ),
                          ],
                        ),

                        TableRow(
                          children: [
                            customTableKeyCell(text: 'Consultation', context: context),
                            customTableValueCell(
                              text: storeDocs[widget.currentIndex]['consultation'],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),

                  customButton(
                      onPressed: ()

                  {
                    _showDoneAndArchivedDialog(context: context, doneOnPressed: ()
                    {
                      /*RequestCubit.get(context).technicalDoneRequest(
                        city: city.toString(),
                        companyName: companyName.toString(),
                        school: school.toString(),
                        machineImage: machineImageUrl,
                        machineTypeImage: machineTypeImageUrl,
                        damageImage: damageImageUrl,
                        consultation: consultation.toString(),
                        longitude: longitude,
                        latitude: latitude,
                      );*/
                      FirebaseFirestore.instance.collection(widget.city).doc(widget.city).collection('requests').doc(widget.id).delete();

                      showToast(
                        message:
                        'Request Done Successfully',
                        state: ToastStates.SUCCESS,
                      );
                      navigateAndFinish(context, const HomeLayout());
                    }, archivedOnPressed: () {
                      /*RequestCubit.get(context).technicalArchivedRequest(
                        city: city.toString(),
                        companyName: companyName.toString(),
                        school: school.toString(),
                        machineImage: machineImageUrl,
                        machineTypeImage: machineTypeImageUrl,
                        damageImage: damageImageUrl,
                        consultation: consultation.toString(),
                        longitude: longitude,
                        latitude: latitude,
                      );*/

                      FirebaseFirestore.instance.collection(widget.city).doc(widget.city).collection('requests').doc(widget.id).delete();

                      showToast(
                        message:
                        'Request still Archived',
                        state: ToastStates.WARNING,
                      );
                      navigateAndFinish(context, const HomeLayout());
                    },
                    );
                  }, text: 'Finish',
                  ),
                ],
              );
                },
            );
          }else
          {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }

  Widget customTableKeyCell({
    required String text,
    required context,
  }) =>
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20.0,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      );

  Widget customTableValueCell({
    required String text,
  }) =>
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      );

  Widget customRequestAction({
    required VoidCallback onTap,
    required Color backgroundColor,
    required IconData icon,
    required String label,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Chip(
          elevation: 20.0,
          backgroundColor: backgroundColor,
          avatar: Icon(
            icon,
            color: Colors.white,
          ),
          label: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

  Future<bool> _showDoneAndArchivedDialog(
      {
        context,
        required VoidCallback doneOnPressed,
        required VoidCallback archivedOnPressed,
      }) async
  {
    return await showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text('Finishing Request'),
      content: const Text('If Request is Done!, Enter the Done Button, if not Enter the Archive Button.'),
      actions: [
        customButton(onPressed: doneOnPressed, text: 'Done',backgroundColor: Colors.green,),
        customButton(onPressed: archivedOnPressed, text: 'Archive',backgroundColor: Colors.red,),
      ],
    ));
  }
}
