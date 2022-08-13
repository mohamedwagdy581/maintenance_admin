import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/constants.dart';
import '../shared/network/cubit/cubit.dart';
import '../shared/network/cubit/states.dart';
import '../shared/network/local/cash_helper.dart';
import '../style/custom_icons.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {

        var cubit = AppCubit.get(context);
        uId = CashHelper.getData(key: 'uId');

        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.appBarTitle[cubit.currentIndex]),
          ),
          // ***********************  The Scaffold Body  ***********************
          body: cubit.screens[cubit.currentIndex],

          // Bottom Navigation Bar
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index)
            {
              cubit.changeBottomNavBar(index);
            },
            items:
            const [
              BottomNavigationBarItem(
                icon: Icon(
                  CustomIcons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CustomIcons.settings,
                ),
                label: 'Settings',
              ),
            ],
            currentIndex: cubit.currentIndex,
          ),
        );
      },
    );
  }
}
