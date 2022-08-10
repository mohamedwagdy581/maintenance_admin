import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
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
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0,),
                        child: Column(
                          children: [
                            Text(
                              'Company Name',
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0,),
                        child: Column(
                          children: [
                            Text(
                              'Baruzik',
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                        ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0,),
                        child: Column(
                          children: [
                            Text(
                              'City',
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0,),
                        child: Column(
                          children: [
                            Text(
                              'Jazan',
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0,),
                        child: Column(
                          children: [
                            Text(
                              'School',
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0,),
                        child: Column(
                          children: [
                            Text(
                              'Emmarah',
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0,),
                        child: Column(
                          children: [
                            Text(
                              'Machine Type',
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0,),
                        child: Column(
                          children: [
                            Text(
                              'Sharp',
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0,),
                        child: Column(
                          children: [
                            Text(
                              'Consultation',
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0,),
                        child: Column(
                          children: [
                            Text(
                              'sdfhepdlknflkasnldkfnlsaknlskdnflkanlsdnflaksdlfknalskdnflaksndflknsdlfkn',
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
