import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../network/cubit/cubit.dart';

// Reusable Navigate Function and return to the previous screen
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

// Reusable Navigate Function and remove the previous screen
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

// Reusable TextFormField Function with validator
Widget defaultTextFormField({
  required TextEditingController? controller,
  required TextInputType keyboardType,
  required String? label,
  TextStyle? textStyle,
  VoidCallback? onTap,
  required String? Function(String?)? validator,
  Function(String)? onSubmitted,
  bool secure = false,
  required IconData? prefix,
  Color? prefixColor,
  IconData? suffix,
  Color? suffixColor,
  VoidCallback? suffixPressed,
  bool? isClickable,
}) =>
    TextFormField(
      style: textStyle,
      controller: controller,
      keyboardType: keyboardType,
      onTap: onTap,
      enabled: isClickable,
      validator: validator,
      obscureText: secure,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
              prefix,
            color: prefixColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(suffix),
            onPressed: suffixPressed,
            color: suffixColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          )),
    );

Widget defaultButton({
  required VoidCallback onPressed,
  required String text,
  Color? backgroundColor,
}) =>
    Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.blue,
      ),
      child: MaterialButton(
        color: backgroundColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget customCard({
  required VoidCallback onTap,
  required String title,
}) =>
    Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(5.0),
      height: 200.0,
      width: 180.0,
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 15.0,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );

Widget customButton({
  required VoidCallback onPressed,
  required String text,
  Color? backgroundColor,
}) =>
    Container(
      //height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0),),),
        ),
        child: Text(
          text,
        ),
      ),
    );

Widget defaultTextButton({
  required VoidCallback onPressed,
  required String text,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

void showToast({
  required String message,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

Color? chooseToastColor(ToastStates state) {
  Color? color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}

Widget customListTile({
  VoidCallback? onTapped,
  required Widget title,
  Widget? leadingWidget,
  Widget? trailingWidget,
}) {
  return InkWell(
    onTap: onTapped,
    child: ListTile(
      title: title,
      leading: leadingWidget,
      trailing: trailingWidget,
    ),
  );
}

