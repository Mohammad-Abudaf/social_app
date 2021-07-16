import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/shared/cubits/appcubit/app_cubit.dart';
import 'package:social_app/shared/cubits/appcubit/app_cubit.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News Feed',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: ConditionalBuilder(
            condition: AppCubit.get(context).userModel != null,
            builder: (context) => Column(
              children: <Widget>[
                if(!FirebaseAuth.instance.currentUser.emailVerified)
                  Container(
                    color: Colors.amber.withOpacity(0.6),
                    height: 50.0,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.info_outline),
                        SizedBox(width: 20.0),
                        Text(
                          'please verify your email',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.currentUser.sendEmailVerification().then((value) {
                                Fluttertoast.showToast(
                                    msg: 'check your mail',
                                    backgroundColor: Colors.deepOrange,
                                    gravity: ToastGravity.BOTTOM,
                                    toastLength: Toast.LENGTH_LONG
                                ).catchError((error){
                                  Fluttertoast.showToast(
                                      msg: error.toString(),
                                      backgroundColor: Colors.deepOrange,
                                      gravity: ToastGravity.BOTTOM,
                                      toastLength: Toast.LENGTH_LONG
                                  );
                                });
                              });
                            },
                            child: Text(
                              'send',
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 20.0
                              ),
                            ))
                      ],
                    ),
                  ),
              ],
            ),
            fallback: (context) => Center(child: CircularProgressIndicator(),),
          ),
        );
      },
    );
  }
}
