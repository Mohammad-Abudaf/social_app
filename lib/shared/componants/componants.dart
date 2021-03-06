import 'package:flutter/material.dart';
import 'package:social_app/shared/styles/colors.dart';

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  IconData prefix,
  IconData suffix,
  Function suffixPressed,
  String hintText,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget defaultButton({
  Color btnColor = MAIN_COLOR,
  double height = 50.0,
  double width = double.infinity,
  @required Function onPressed,
  @required String label,
  Color textColor = Colors.white,
}) =>
    MaterialButton(
      color: btnColor,
      height: height,
      minWidth: width,
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

Widget defaultTextBtn({
  @required String text,
  double fontSize = 20.0,
  FontWeight fontWeight = FontWeight.w500,
  @required Function function

}) => TextButton(
    onPressed: function,
    child: Text(
     text,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    ));
