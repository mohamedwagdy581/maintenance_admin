import 'package:flutter/material.dart';

class ArchivedAndDoneRequestDetailsScreen extends StatelessWidget {
  final Widget requestCompanyName;
  final Widget requestCompanyCity;
  final Widget requestCompanySchool;
  final Widget requestCompanyMachine;
  final Widget requestCompanyMachineType;
  final Widget requestCompanyConsultation;
  final Map<dynamic, dynamic>? doneRequestsData;
  final Map<dynamic, dynamic>? archivedRequestsData;

  const ArchivedAndDoneRequestDetailsScreen({
    super.key,
    required this.requestCompanyName,
    required this.requestCompanyCity,
    required this.requestCompanySchool,
    required this.requestCompanyMachine,
    required this.requestCompanyMachineType,
    required this.requestCompanyConsultation,
    this.doneRequestsData,
    this.archivedRequestsData,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
                        widget: requestCompanyName,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      customTableKeyCell(text: 'City', context: context),
                      customTableValueCell(
                        widget: requestCompanyCity,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      customTableKeyCell(text: 'School', context: context),
                      customTableValueCell(
                        widget: requestCompanySchool,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      customTableKeyCell(text: 'Machine Image', context: context),
                      customTableValueCell(
                        widget: requestCompanyMachine,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      customTableKeyCell(text: 'Machine Type Image', context: context),
                      customTableValueCell(
                        widget: requestCompanyMachineType,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      customTableKeyCell(text: 'Damage Image', context: context),
                      customTableValueCell(
                        widget: requestCompanyMachineType,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      customTableKeyCell(text: 'Consultation', context: context),
                      customTableValueCell(
                        widget: requestCompanyConsultation,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
          ],
        ),
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
    required Widget widget,
  }) =>
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            widget,
          ],
        ),
      );

}
