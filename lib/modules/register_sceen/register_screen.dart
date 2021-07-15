import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/shared/componants/componants.dart';
import 'package:social_app/shared/styles/colors.dart';

class RegisterScreen extends StatefulWidget{
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var fNameController = TextEditingController();

  var lNameController = TextEditingController();

  var userNameController = TextEditingController();

  var phoneNumberController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  bool _isShown = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w400,
                      color: MAIN_COLOR,
                    ),
                  ),
                  SizedBox(height: 25.0,),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: defaultFormField(
                              controller: fNameController,
                              type: TextInputType.text,
                              validate: (String value){
                                if(value == null || value.isEmpty){
                                  return 'name must not be empty';
                                }
                                return null;
                              }, label: 'first name'
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: defaultFormField(
                              controller: lNameController,
                              type: TextInputType.text,
                              validate: (String value){
                                if(value == null || value.isEmpty){
                                  return 'last name must not be empty';
                                }
                                return null;
                              }, label: 'last name'
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.0,),
                  defaultFormField(
                      controller: userNameController,
                      type: TextInputType.name,
                      prefix: Icons.person,
                      validate: (String value){
                        if(value == null || value.isEmpty){
                          return 'name must not be empty';
                        }
                        return null;
                      }, label: 'user name'
                  ),
                  SizedBox(height: 25.0,),
                  defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      prefix: Icons.email,
                      validate: (String value){
                        if(value == null || value.isEmpty){
                          return 'name must not be empty';
                        }
                        return null;
                      }, label: 'email'
                  ),
                  SizedBox(height: 25.0,),
                  defaultFormField(
                      controller: phoneNumberController,
                      type: TextInputType.phone,
                      prefix: Icons.phone,
                      validate: (String value){
                        if(value == null || value.isEmpty){
                          return 'name must not be empty';
                        }
                        return null;
                      }, label: 'phone number'
                  ),
                  SizedBox(height: 25.0,),
                  defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      prefix: Icons.lock,
                      isPassword: _isShown,
                      suffix: _isShown? Icons.visibility : Icons.visibility_off,
                      suffixPressed: (){
                        _isShown = !_isShown;
                        setState(() {});
                      },
                      validate: (String value){
                        if(value == null || value.isEmpty){
                          return 'name must not be empty';
                        }
                        return null;
                      }, label: 'password'
                  ),
                  SizedBox(height: 25.0,),
                  defaultFormField(
                      controller: confirmPasswordController,
                      type: TextInputType.visiblePassword,
                      isPassword: _isShown,
                      prefix: Icons.lock,
                      validate: (String value){
                        if(value == null || value.isEmpty){
                          return 'name must not be empty';
                        }
                        return null;
                      }, label: 'confirm password'
                  ),
                  SizedBox(height: 25.0,),
                  defaultButton(label: 'Sign Up', onPressed: (){}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}