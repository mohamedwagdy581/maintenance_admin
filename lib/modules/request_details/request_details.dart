import 'package:flutter/material.dart';

class RequestDetails extends StatelessWidget {
  final Widget requestCompanyName;
  final Widget requestCompanyCity;
  final Widget requestCompanySchool;
  final Widget requestCompanyMachine;
  final Widget requestCompanyMachineType;
  final Widget requestCompanyConsultation;

  const RequestDetails({
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
                    customTableKeyCell(text: 'Machine', context: context),
                    customTableValueCell(
                      widget: requestCompanyMachine,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    customTableKeyCell(text: 'Machine Type', context: context),
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
          Wrap(
            spacing: 20.0, // gap between adjacent chips
            runSpacing: 10.0, // gap between lines
            children: [
              customRequestAction(
                onTap: () {},
                backgroundColor: Colors.green,
                icon: Icons.done,
                label: 'Done',
              ),
              customRequestAction(
                onTap: () {},
                backgroundColor: Colors.grey,
                icon: Icons.archive_outlined,
                label: 'Archive',
              ),
              customRequestAction(
                onTap: () {},
                backgroundColor: Colors.red,
                icon: Icons.delete_forever,
                label: 'Delete',
              ),
            ],
          )
        ],
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
}
