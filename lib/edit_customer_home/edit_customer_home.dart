import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maintenance_admin/shared/components/components.dart';
import 'package:maintenance_admin/shared/network/cubit/cubit.dart';
import 'package:maintenance_admin/shared/network/cubit/states.dart';

class EditCustomerHome extends StatelessWidget {
  EditCustomerHome({Key? key}) : super(key: key);

  TimeOfDay? picked;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  TextEditingController timeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Update Home',
            ),
          ),
          body: ListView(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (cubit.isBottomSheetShown) {
                if (formKey.currentState!.validate()) {
                  //TODO: Update Lists
                  /*cubit.insertToDatabase(
                title: titleController.text,
                time: timeController.text,
                date: dateController.text,
              );*/
                }
              } else {
                scaffoldKey.currentState!
                    .showBottomSheet(
                      (context) => SizedBox(
                        height: 300.0,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Form(
                            key: formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // **************** Title TextFormField *******************
                                  defaultTextFormField(
                                    onTap: () {},
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Title must not be empty';
                                      }
                                      return null;
                                    },
                                    controller: titleController,
                                    keyboardType: TextInputType.text,
                                    prefix: Icons.title,
                                    label: 'Task Title',
                                  ),

                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  // **************** Time TextFormField *******************
                                  defaultTextFormField(
                                    controller: timeController,
                                    onTap: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then(
                                        (value) {
                                          timeController.text =
                                              value!.format(context).toString();
                                        },
                                      );
                                    },
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Time must mot be empty';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.datetime,
                                    prefix: Icons.watch_later_outlined,
                                    label: 'Task Time',
                                  ),

                                  const SizedBox(
                                    height: 20.0,
                                  ),

                                  // **************** Date TextFormField *******************
                                  defaultTextFormField(
                                    controller: dateController,
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2022-02-21'),
                                      ).then((date) {
                                        dateController.text =
                                            DateFormat.yMMMd().format(date!);
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Date must mot be empty';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.datetime,
                                    prefix: Icons.calendar_today,
                                    label: 'Task Date',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      elevation: 20.0,
                    )
                    .closed
                    .then((value) {
                  cubit.changeBottomSheet(isShow: false, icon: Icons.edit);
                });
                cubit.changeBottomSheet(isShow: true, icon: Icons.add);
              }
            },
            child: Icon(
              cubit.fabIcon,
            ),
          ),
        );
      },
    );
  }
}
