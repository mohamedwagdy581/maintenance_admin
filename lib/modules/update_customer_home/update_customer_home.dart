import 'package:flutter/material.dart';
import 'package:maintenance_admin/modules/update_customer_home/update_cities/update_cities.dart';
import 'package:maintenance_admin/modules/update_customer_home/update_companies/update_companies.dart';
import 'package:maintenance_admin/modules/update_customer_home/update_machine_types/update_machine_types.dart';
import 'package:maintenance_admin/modules/update_customer_home/update_machines/update_machines.dart';
import 'package:maintenance_admin/shared/components/components.dart';

import '../requests/archived_requests/archived_requests_screen.dart';
import '../requests/done_requests/done_requests_screen.dart';
import '../technicals/all_technicals/all_technicals_screen.dart';

class UpdateCustomerHome extends StatefulWidget {
  const UpdateCustomerHome({Key? key}) : super(key: key);

  @override
  State<UpdateCustomerHome> createState() => _UpdateCustomerHomeState();
}

class _UpdateCustomerHomeState extends State<UpdateCustomerHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Home'),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customCard(
                  onTap: () {
                    navigateTo(context, const UpdateCompaniesList());
                  },
                  title: 'All Companies'),
              customCard(
                  onTap: () {
                    navigateTo(context, const UpdateCities());
                  },
                  title: 'All Cities'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customCard(
                  onTap: () {
                    navigateTo(context, const UpdateMachines());
                  },
                  title: 'All Machines'),
              customCard(
                onTap: () {
                  navigateTo(context, const UpdateMachineTypes());
                },
                title: 'All Machine Types',
              ),
            ],
          ),
        ],
      ),

    );
  }


}
