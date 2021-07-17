import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubits/appcubit/app_cubit.dart';
import 'package:social_app/shared/cubits/appcubit/app_cubit.dart';
import 'package:social_app/shared/styles/colors.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      child: Card(
                        elevation: 5.0,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                '${cubit.userModel.coverImage}')),
                      ),
                    ),
                    Container(
                      height: 240.0,
                      child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: CircleAvatar(
                          radius: 54,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                '${cubit.userModel.image}'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '${cubit.userModel.userName}',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${cubit.userModel.bio}',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 17.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Text(
                              '100',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 31),
                            ),
                            Text(
                              'Post',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Text(
                              '254',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 31),
                            ),
                            Text(
                              'Photos',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Text(
                              '10.3k',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 31),
                            ),
                            Text(
                              'Followers',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Text(
                              '101',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 31),
                            ),
                            Text(
                              'following',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Add Photo',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: MAIN_COLOR,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.edit_outlined,
                        color: MAIN_COLOR,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
