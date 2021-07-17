import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/componants/componants.dart';
import 'package:social_app/shared/cubits/appcubit/app_cubit.dart';
import 'package:social_app/shared/styles/colors.dart';

class UpdateProfileScreen extends StatelessWidget {
  var userNameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var userModel = AppCubit.get(context).userModel;
        var cubit = AppCubit.get(context);
        userNameController.text = cubit.userModel.userName;
        bioController.text = cubit.userModel.bio;
        phoneController.text = cubit.userModel.phone;
        emailController.text = cubit.userModel.email;
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 5.0,
            title: Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 10.0),
                child: defaultTextBtn(
                  text: 'update',
                  function: (){
                    if(formKey.currentState.validate()){
                      cubit.updateUserData(
                          userName: userNameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                          bio: bioController.text,
                        profileImage: cubit.profileImageUrl,
                        coverImage: cubit.coverImageUrl,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    if(state is AppLoadingState)
                      LinearProgressIndicator(),
                    if(state is AppLoadingState)
                    SizedBox(height: 10.0),
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
                                image: cubit.coverImage == null? NetworkImage('${userModel.coverImage}'): FileImage(cubit.coverImage)),
                          ),
                        ),
                        Container(
                          height: 240.0,
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  radius: 54,
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: cubit.profileImage == null? NetworkImage('${userModel.image}') : FileImage(cubit.profileImage)
                                  ),
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MAIN_COLOR.withOpacity(0.5),
                                  ),
                                  child: IconButton(
                                      iconSize: 20.0,
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        cubit.getProfileImage();
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: MAIN_COLOR.withOpacity(0.5),
                                ),
                                child: IconButton(
                                    iconSize: 20.0,
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      cubit.getCoverImage();
                                    }),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    if(cubit.coverImage != null || cubit.profileImage != null)
                    Row(
                      children: <Widget>[
                        if(cubit.profileImage != null)
                          Expanded(
                          child: defaultButton(
                              onPressed: (){
                                cubit.uploadProfilePic(email: emailController.text, phone: phoneController.text, userName: userNameController.text, bio: bioController.text, image: AppCubit.get(context).profileImageUrl);
                              },
                              label: 'upload profile image'),
                        ),
                        SizedBox(width: 5.0,),
                        if(cubit.coverImage != null)
                          Expanded(
                          child: defaultButton(
                              onPressed: (){
                                cubit.uploadCoverPic(email: emailController.text, phone: phoneController.text, userName: userNameController.text, bio: bioController.text, image: AppCubit.get(context).coverImageUrl);
                              },
                              label: 'upload cover image'),
                        ),
                      ],
                    ),
                    if(cubit.coverImage != null || cubit.profileImage != null)
                      SizedBox(height: 20.0),
                    defaultFormField(
                      controller: userNameController,
                      type: TextInputType.text,
                      validate: (String value){
                        if(value.isEmpty){
                          return 'user name must not be empty';
                        } else {
                          return null;
                        }
                      },
                      label: 'user name',
                      prefix: Icons.supervised_user_circle_outlined,
                    ),
                    SizedBox(height: 10.0),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String value){
                        if(value.isEmpty){
                          return 'email must not be empty';
                        } else {
                          return null;
                        }
                      },
                      label: 'email',
                      prefix: Icons.email,
                    ),
                    SizedBox(height: 10.0),
                    defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (String value){
                        if(value.isEmpty){
                          return 'phone number must not be empty';
                        } else {
                          return null;
                        }
                      },
                      label: 'phone number',
                      prefix: Icons.phone,
                    ),
                    SizedBox(height: 10.0),
                    defaultFormField(
                      controller: bioController,
                      type: TextInputType.text,
                      validate: (String value){
                          return null;
                          },
                      label: 'bio',
                      prefix: Icons.info_outline,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
