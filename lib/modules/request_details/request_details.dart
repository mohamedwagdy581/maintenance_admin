import 'package:flutter/material.dart';

class RequestDetails extends StatelessWidget {
  final Widget requestCompanyName;
  final Widget requestCompanyCity;
  final Widget requestCompanySchool;
  final Widget requestCompanyMachine;
  final Widget requestCompanyMachineType;
  final Widget requestCompanyConsultation;

  const RequestDetails(

  {
    super.key,
    required this.requestCompanyName,
    required this.requestCompanyCity,
    required this.requestCompanySchool,
    required this.requestCompanyMachine,
    required this.requestCompanyMachineType,
    required this.requestCompanyConsultation,
});


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Text(
            'Request From : ',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontSize: 22.0
            ),
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
                          requestCompanyName,
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
                          requestCompanyCity,
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
                          requestCompanySchool,
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
                            'Machine',
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
                          requestCompanyMachine,
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
                          requestCompanyMachineType,
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
                          requestCompanyConsultation,
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
    );
  }
}
