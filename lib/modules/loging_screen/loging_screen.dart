import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_app/modules/register_sceen/register_screen.dart';
import 'package:social_app/shared/componants/componants.dart';
import 'package:social_app/shared/styles/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool _isShown = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 90,
                            fontWeight: FontWeight.w400,
                            color: MAIN_COLOR,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Login to Make Whole World in Small App',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'email must not be empty!';
                            }
                            return null;
                          },
                          label: 'Email Address',
                          type: TextInputType.emailAddress,
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          isPassword: _isShown,
                          suffix: _isShown? Icons.visibility : Icons.visibility_off,
                          suffixPressed: (){
                            _isShown = !_isShown;
                            setState(() {});
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                            return null;
                          },
                          label: 'password',
                          type: TextInputType.visiblePassword,
                          prefix: Icons.lock,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                          btnColor: MAIN_COLOR,
                          height: 50.0,
                          width: double.infinity,
                          label: 'Login',
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              print('loginScreen');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'don\'t have an account?',
                  style: TextStyle(color: Colors.grey[500], fontSize: 15.0),
                ),
                TextButton(
                    onPressed: () {
                      navigateTo(context, RegisterScreen());
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: MAIN_COLOR),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
