import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubits/appcubit/app_cubit.dart';
import 'package:social_app/shared/styles/colors.dart';

class NewPostScreen extends StatelessWidget {
  var postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var now = DateTime.now();
        var cubit = AppCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'ِAdd Post',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if (cubit.postImage == null) {
                        cubit.createPost(
                            text: postController.text,
                            timeDate: now.toString());
                      } else {
                        cubit.uploadPostImage(
                            text: postController.text,
                            timeDate: now.toString()
                        );
                      }
                    },
                    child: Text(
                      'POST',
                      style: TextStyle(color: MAIN_COLOR, fontSize: 20),
                    )
                ), SizedBox(width: 10.0,)
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: <Widget>[
                  if (state is AppCreatePostLoading) LinearProgressIndicator(),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 33.0,
                        backgroundImage:
                            NetworkImage('${cubit.userModel.image}'),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '${cubit.userModel.userName}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Expanded(
                      child: TextFormField(
                    controller: postController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'what is on your mind ... ',
                      hintStyle: TextStyle(fontSize: 17.0),
                    ),
                  )),
                  if (cubit.postImage != null)
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: <Widget>[
                        Container(
                          height: 200.0,
                          width: double.infinity,
                          child: Card(
                            elevation: 5.0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image(
                                fit: BoxFit.cover,
                                image: FileImage(cubit.postImage)
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.5),
                          child: IconButton(icon: Icon(Icons.close, color: MAIN_COLOR,), onPressed: (){
                            cubit.removePostImage();
                          }),
                        )
                      ],
                    ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              AppCubit.get(context).getPostImage();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_photo_alternate_outlined,
                                  color: MAIN_COLOR,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('app photo'),
                              ],
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('#tags'),
                              ],
                            )),
                      ),
                    ],
                  ),
                ]
                )
            )
        );
      },
    );
  }
}
