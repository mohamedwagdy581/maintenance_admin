import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_admin/layout/home_layout.dart';

import '../../shared/components/components.dart';
import '../../shared/network/cubit/cubit.dart';
import '../login/login_screen.dart';
import 'register_cubit/register_cubit.dart';
import 'register_cubit/register_states.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var idController = TextEditingController();

  var areaController = TextEditingController();

  var schoolController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var phoneController = TextEditingController();

  int _areaValue = 0;
  String _area = '';
  var areas = <String>[
    'إختر المنطقة؟',
    'أبوعريش',
    'جازان',
    'أحدالمسارحة',
    'العارضة',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state)
        {
          // Listener in create user success state if success navigate and finish to Home Layout
          if(state is CreateUserSuccessState)
          {
            navigateAndFinish(context, const HomeLayout());
          }
        },
        builder: (context, state)
        {
          var height = MediaQuery.of(context).size.height;

          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign Up',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1?.copyWith(
                            fontSize: 35.0,
                          ),
                        ),

                        //SizedBox between SignUp Text and Login to Start Text
                        SizedBox(
                          height: height * 0.019,
                        ),

                        Text(
                          'Register to start connect with your company',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                            color: Colors.grey,
                          ),
                        ),

                        SizedBox(
                          height: height * 0.033,
                        ),

                        // TextFormField of Name
                        defaultTextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          label: 'Name',
                          textStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color:
                            AppCubit.get(context).isDark ? Colors.black : Colors.white,
                          ),
                          validator: (String? value) {
                            if(value!.isEmpty)
                            {
                              return 'Please enter your Name';
                            }
                            return null;
                          },
                          prefix: Icons.person,
                          prefixColor: AppCubit.get(context).isDark ? Colors.black : Colors.white,
                        ),
                        SizedBox(
                          height: height * 0.033,
                        ),

                        // TextFormField of Name
                        defaultTextFormField(
                          controller: idController,
                          keyboardType: TextInputType.number,
                          label: 'ID',
                          textStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color:
                            AppCubit.get(context).isDark ? Colors.black : Colors.white,
                          ),
                          validator: (String? value) {
                            if(value!.isEmpty)
                            {
                              return 'Please enter your ID';
                            }
                            return null;
                          },
                          prefix: Icons.card_membership,
                          prefixColor: AppCubit.get(context).isDark ? Colors.black : Colors.white,
                        ),
                        SizedBox(
                          height: height * 0.033,
                        ),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[300],
                          ),
                          child: ListTile(
                            title: const Text(
                              'Select Machine Type',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            trailing: DropdownButton<String>(
                              hint: const Text('المنطقة',textAlign: TextAlign.end,),
                              value: areas[_areaValue],
                              items: areas.map((String areaValue) {
                                return DropdownMenuItem<String>(
                                  value: areaValue,
                                  child: Text(areaValue),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _areaValue = areas.indexOf(value!);
                                  _area = value.toString();
                                  print(_area);
                                });
                              },
                            ),
                          ),
                        ),
                        // TextFormField of Name
                        /*Row(
                          children: [
                            Expanded(
                              child: defaultTextFormField(
                                controller: areaController,
                                keyboardType: TextInputType.name,
                                label: 'area',
                                textStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                                  color:
                                  AppCubit.get(context).isDark ? Colors.black : Colors.white,
                                ),
                                validator: (String? value) {
                                  if(value!.isEmpty)
                                  {
                                    return 'Please enter your area';
                                  }
                                  return null;
                                },
                                prefix: Icons.area_chart_outlined,
                                prefixColor: AppCubit.get(context).isDark ? Colors.black : Colors.white,
                              ),
                            ),
                            DropdownButton<String>(
                              hint: const Text('المنطقة',textAlign: TextAlign.end,),
                              value: areas[_areaValue],
                              items: areas.map((String areaValue) {
                                return DropdownMenuItem<String>(
                                  value: areaValue,
                                  child: Text(areaValue),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _areaValue = areas.indexOf(value!);
                                  _area = value.toString();
                                  print(value.toString());
                                });
                              },
                            ),
                          ],
                        ),*/

                        SizedBox(
                          height: height * 0.033,
                        ),

                        // TextFormField of Name
                        defaultTextFormField(
                          controller: schoolController,
                          keyboardType: TextInputType.name,
                          label: 'School',
                          textStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color:
                            AppCubit.get(context).isDark ? Colors.black : Colors.white,
                          ),
                          validator: (String? value) {
                            if(value!.isEmpty)
                            {
                              return 'Please enter your School';
                            }
                            return null;
                          },
                          prefix: Icons.area_chart_outlined,
                          prefixColor: AppCubit.get(context).isDark ? Colors.black : Colors.white,
                        ),

                        //SizedBox between Name and Email Address TextFormField
                        SizedBox(
                          height: height * 0.019,
                        ),

                        // TextFormField of Email Address
                        defaultTextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'Email Address',
                          textStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color:
                            AppCubit.get(context).isDark ? Colors.black : Colors.white,
                          ),
                          validator: (String? value) {
                            if(value!.isEmpty)
                            {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                          prefix: Icons.email_outlined,
                          prefixColor: AppCubit.get(context).isDark ? Colors.black : Colors.white,
                        ),

                        //SizedBox between Email and Phone TextFormField
                        SizedBox(
                          height: height * 0.019,
                        ),

                        // TextFormField of Phone
                        defaultTextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          label: 'Phone',
                          textStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color:
                            AppCubit.get(context).isDark ? Colors.black : Colors.white,
                          ),
                          validator: (String? value) {
                            if(value!.isEmpty)
                            {
                              return 'Please enter your Phone';
                            }
                            return null;
                          },
                          prefix: Icons.phone,
                          prefixColor: AppCubit.get(context).isDark ? Colors.black : Colors.white,
                        ),

                        //SizedBox between Phone and Password TextFormField
                        SizedBox(
                          height: height * 0.019,
                        ),

                        // TextFormField of Password
                        defaultTextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          label: 'Password',
                          textStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color:
                            AppCubit.get(context).isDark ? Colors.black : Colors.white,
                          ),
                          validator: (String? value) {
                            if(value!.isEmpty)
                            {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                          secure: RegisterCubit.get(context).isPasswordShown,
                          prefix: Icons.password,
                          prefixColor: AppCubit.get(context).isDark ? Colors.black : Colors.white,
                          suffix: RegisterCubit.get(context).suffix,
                          suffixColor: AppCubit.get(context).isDark ? Colors.black : Colors.white,
                          suffixPressed: ()
                          {
                            RegisterCubit.get(context).changePasswordVisibility();
                          },
                        ),

                        //SizedBox between Password and Login Button
                        SizedBox(
                          height: height * 0.034,
                        ),

                        // Register Button
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) =>
                              defaultButton(
                                onPressed: () {
                                  if(formKey.currentState!.validate())
                                  {
                                    RegisterCubit.get(context).userRegister(
                                      name: nameController.text,
                                      id: idController.text,
                                      area: _area,
                                      school: schoolController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                      image: '',
                                    );
                                  }
                                },
                                text: 'Register',
                                backgroundColor:
                                AppCubit.get(context).isDark ? Colors.blue : Colors.deepOrange,
                              ),
                          fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
