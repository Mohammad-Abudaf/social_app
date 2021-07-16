import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/shared/cubits/appcubit/app_cubit.dart';

class NewPostScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'new post',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(),
    );
  }
}