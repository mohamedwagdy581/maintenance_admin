import 'package:flutter/material.dart';
import 'package:maintenance_admin/modules/abo_areesh/abo_areesh_screen.dart';
import 'package:maintenance_admin/modules/al_ahad/al_ahad_screen.dart';
import 'package:maintenance_admin/modules/al_ardah/al_ardah_screen.dart';
import 'package:maintenance_admin/modules/settings/settings_screen.dart';
import 'package:maintenance_admin/shared/components/components.dart';

import '../modules/jazan/jazan_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: defaultTextButton(
              onPressed: () {
                navigateTo(context, const SettingsScreen());
              },
              text: 'Settings',
            ),
          ),
        ],
      ),
      // ***********************  The Scaffold Body  ***********************
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customCard(
                  onTap: () {
                    navigateTo(context, const JazanScreen(title: 'جازان',));
                  },
                  title: 'جازان',
              ),
              customCard(
                  onTap: () {
                    navigateTo(context, const AboAreeshScreen(title: 'أبوعريش',));
                  },
                  title: 'أبو عريش',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customCard(
                  onTap: () {
                    navigateTo(context, const AlAhadScreen(title: 'أحدالمسارحة',));
                  },
                  title: 'أحد المسارحة',
              ),
              customCard(
                  onTap: () {
                    navigateTo(context, const AlArdahScreen(title: 'العارضة',));
                  },
                  title: 'العارضة',
              ),
            ],
          ),
        ],
      ),
    );
  }

}
