import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_admin/modules/history/history.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/cubit/cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Settings Screen',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.033,
            ),

            Container(
              padding: const EdgeInsets.only(left: 20.0,bottom: 10.0),
              alignment: Alignment.topLeft,
              child: Text(
                'Name : ${user!.displayName.toString()}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),

            SizedBox(
              height: height * 0.033,
            ),

            Container(
                padding: const EdgeInsets.only(left: 20.0,bottom: 20.0,),
                alignment: Alignment.topLeft,
                child: Text(
                  'Email : ${user.email.toString()}',
                  style: Theme.of(context).textTheme.bodyText1,
                )),

            SizedBox(
              height: height * 0.033,
            ),

            customListTile(
              context: context,
              onTap: () {
                navigateTo(context, const HistoryScreen());
              },
              prefixIcon: Icons.history_outlined,
              suffixIcon: Icons.chevron_right,
              title: 'History',
              subTitle: 'See All Requests history',
            ),

            SizedBox(
              height: height * 0.033,
            ),
            customListTile(
              context: context,
              onTap: () {
                AppCubit.get(context).changeAppModeTheme();
              },
              prefixIcon: Icons.brightness_4_outlined,
              suffixIcon: AppCubit.get(context).isDark
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
              title: AppCubit.get(context).isDark ? 'Light' : 'Dark',
              subTitle: 'Click to Switch Theme',
            ),

            SizedBox(
              height: height * 0.05,
            ),

            // Logout Button
            SizedBox(
              width: width * 0.4,
              child: defaultButton(
                onPressed: () {
                  signOut(context);
                },
                text: 'LOGOUT',
                backgroundColor: AppCubit.get(context).isDark
                    ? Colors.blue
                    : Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customListTile({
    required context,
    VoidCallback? onTap,
    required IconData prefixIcon,
    required IconData suffixIcon,
    required String title,
    required String subTitle,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          onTap: onTap,
          leading: Icon(
            prefixIcon,
            color:
                AppCubit.get(context).isDark ? Colors.blue : Colors.deepOrange,
            size: 35.0,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subTitle,
            style: Theme.of(context).textTheme.caption,
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              suffixIcon,
              color: AppCubit.get(context).isDark
                  ? Colors.blue
                  : Colors.deepOrange,
            ),
          ),
        ),
      );
}
